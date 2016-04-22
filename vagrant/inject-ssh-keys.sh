#!/bin/bash
#
# This script injects ssh keys for root
#
# Author: Stefan Lapers <stefan@lapers.be>
#
# Copyright 2014 Stefan Lapers

# RUNTIME VARIABLES
#-----------------------------------------------------------------------------
SSHDIR=/root/.ssh
AUTHKEYS=/root/.ssh/authorized_keys

MKDIR='/bin/mkdir'
CHMOD='/bin/chmod'
TOUCH='/bin/touch'
CHOWN='/bin/chown'
ECHO='/bin/echo'

# ARGUMENT VARIABLES
#-----------------------------------------------------------------------------
KEY=

#-----------------------------------------------------------------------------
# Function to display this scripts usage
#-----------------------------------------------------------------------------

usage()
{
  cat << EOF
  
Usage: $0 options
  
  This script injects ssh keys for the root user, creating necessary files and
  folders where necessary.
    
  OPTIONS:
     -h   Show this message
     -k   (Required) SSH Key to add to ${AUTHKEYS}
       
EOF
}

#-----------------------------------------------------------------------------
# Parse command line arguments
#-----------------------------------------------------------------------------
while getopts "hk:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    k)
      KEY=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

if [[ -z $KEY ]]
then
    usage
    exit 1
fi

#-----------------------------------------------------------------------------
# Create any missing folder / file
#-----------------------------------------------------------------------------

if [ ! -d $SSHDIR ]
  then ${MKDIR} -p $SSHDIR
  ${CHMOD} 600 $SSHDIR
  ${CHOWN} root:root $SSHDIR
fi

if [ ! -f $AUTHKEYS ]
  then ${TOUCH} $AUTHKEYS
  ${CHMOD} 600 $AUTHKEYS
fi

#-----------------------------------------------------------------------------
# Inject the SSH key
#-----------------------------------------------------------------------------

${ECHO} ${KEY} >> $AUTHKEYS

exit 0
