#!/bin/bash

https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl

$ oc login -u system:admin
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-privileged
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-controller
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-apiserver


$ export VERSION=v0.11.0
$ oc apply -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt.yaml

$ curl -L -o virtctl \
    https://github.com/kubevirt/kubevirt/releases/download/$VERSION/virtctl-$VERSION-linux-amd64
$ chmod +x virtctl

Deploy a VirtualMachine
Once you deployed KubeVirt you are ready to launch a VM:

# Creating a virtual machine
$ kubectl apply -f https://raw.githubusercontent.com/kubevirt/demo/master/manifests/vm.yaml

# After deployment you can manage VMs using the usual verbs:
$ kubectl get vms
$ kubectl get vms -o yaml testvm

# To start an offline VM you can use
$ ./virtctl start testvm
$ kubectl get vmis
$ kubectl get vmis -o yaml testvm

# To shut it down again
$ ./virtctl stop testvm

# To delete
$ kubectl delete vms testvm
# To create your own
$ kubectl create -f $YOUR_VM_SPEC
Accessing VMs (serial console & spice)
# Connect to the serial console
$ ./virtctl console testvm

# Connect to the graphical display
# Note: Requires `remote-viewer` from the `virt-viewer` package.
$ ./virtctl vnc testvm
User Guide

export AWSACCESSKEYID=$1
export AWSSECRETACCESSKEY=$2 

echo $(date) " - Starting Script"

# Install EPEL repository
echo $(date) " - Installing EPEL"

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

echo $(date) " - EPEL successfully installed"

echo $(date) " - Install Pip"

echo $(date) " - Checkout Git Repo"

yum -y install git

git clone https://github.com/tagliateller/openshift-ansible.git openshift-ansible
cd openshift-ansible
git checkout release-3.11

#https://github.com/openshift/openshift-ansible/tree/release-3.11/playbooks/aws
		
#~/.aws/credentials 
		
#[myaccount]
#aws_access_key_id = <Your access_key here>
#aws_secret_access_key = <Your secret acces key here>

echo $(date) " - Create AWS Credentials"
mkdir -p ~/.aws/
cat > ~/.aws/credentials <<EOF
[myaccount]
aws_access_key_id = ${AWSACCESSKEYID}
aws_secret_access_key = ${AWSSECRETACCESSKEY}
EOF
 
echo $(date) " - Script Complete"

