#!/bin/bash

$ oc login -u system:admin
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-privileged
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-controller
$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-apiserver


$ export VERSION=v0.11.0
$ oc apply -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt.yaml


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

