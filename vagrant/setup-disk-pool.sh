#!/usr/bin/env bash

usage()
{
  cat << EOF

Usage: $0 options

  This script sets up a disk to be used as a thinpool ready for use with the
  devicemapper driver in docker.

  The script wil only check if a pv already exists, so be carefull !!!

  OPTIONS:
     -h   Show this message
     -d   (Required) device path of the disk, eg: /dev/sdb

EOF
}

#-----------------------------------------------------------------------------
# Parse command line arguments
#-----------------------------------------------------------------------------
while getopts "hd:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    d)
      DEVICE=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

if [[ -z $DEVICE ]]
then
    usage
    exit 1
fi

#-----------------------------------------------------------------------------
# Some sanity checks before we start destroying stuff
#-----------------------------------------------------------------------------
lsblk $DEVICE > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Device ${DEVICE} not found.. cannot continue"
    exit -1
fi

if [ `lsblk -ln $DEVICE | wc -l` -ne 1 ]; then
    echo "Device ${DEVICE} seems to contain data.. connot continue"
    exit -1
fi

pvdisplay $DEVICE
if [ $? -ne 5 ]; then
    echo "Device ${DEVICE} is already a PV, refusing to go further"
    exit -1
fi

#-----------------------------------------------------------------------------
# Create the pv
#-----------------------------------------------------------------------------
pvcreate $DEVICE

#-----------------------------------------------------------------------------
# Create the vg
#-----------------------------------------------------------------------------
vgcreate docker $DEVICE

#-----------------------------------------------------------------------------
# Create the lv
#-----------------------------------------------------------------------------
lvcreate --wipesignatures y -n thinpool docker -l 95%VG
lvcreate --wipesignatures y -n thinpoolmeta docker -l 1%VG

#-----------------------------------------------------------------------------
# Convert lv to thin pool
#-----------------------------------------------------------------------------
lvconvert -y --zero n -c 512K --thinpool docker/thinpool --poolmetadata docker/thinpoolmeta

#-----------------------------------------------------------------------------
# Setup autoextension of thin pools through lvm profile
#-----------------------------------------------------------------------------
cat << 'AUTOEXTENSION' > /etc/lvm/profile/docker-thinpool.profile
activation {
    thin_pool_autoextend_threshold=80
    thin_pool_autoextend_percent=20
}
AUTOEXTENSION
lvchange --metadataprofile docker-thinpool docker/thinpool