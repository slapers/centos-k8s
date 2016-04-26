#!/usr/bin/env bash

set -e

K8S_VERSION=${K8S_VERSION:-1.2.3}
K8S_BASEPATH="k8s/${K8S_VERSION}"
K8S_BINPATH="${K8S_BASEPATH}/server/kubernetes/server/bin"

if [ ! -d ${K8S_BASEPATH} ]; then
    echo "Creating ${K8S_BASEPATH}"
    mkdir -p "${K8S_BASEPATH}"
fi

if [ ! -f "${K8S_BASEPATH}/kubernetes.tar.gz" ]; then
    echo "Downloading release ${K8S_VERSION} from github"
    curl -SLo ${K8S_BASEPATH}/kubernetes.tar.gz "https://github.com/kubernetes/kubernetes/releases/download/v${K8S_VERSION}/kubernetes.tar.gz"
fi

if [ ! -d "${K8S_BASEPATH}/kubernetes" ]; then
    echo "Extracting release ${K8S_VERSION} into ${K8S_BASEPATH}/kubernetes"
    tar -zxvf ${K8S_BASEPATH}/kubernetes.tar.gz -C ${K8S_BASEPATH}
fi

if [ ! -d "${K8S_BASEPATH}/server" ]; then
    echo "Extracting server archive to ${K8S_BASEPATH}/server"
    mkdir -p ${K8S_BASEPATH}/server
    tar -zxvf ${K8S_BASEPATH}/kubernetes/server/kubernetes-server-linux-amd64.tar.gz -C ${K8S_BASEPATH}/server/
fi

for file in kube-apiserver kube-controller-manager kube-scheduler kubectl kubelet hyperkube
do
  cp ${K8S_BINPATH}/$file ansible/files/k8s/
done
