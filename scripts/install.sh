#!/bin/bash

echo $(date) " - Starting Script"

export SUDOUSER=$1

curl -L https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
curl -L https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz
curl -L https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz

mkdir -p /opt/oc-v3.9/
tar zxvf openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz -C /opt/oc-v3.9/
chmod -R 755 /opt/oc-v3.9
ln -s /opt/oc-v3.9/oc /home/$SUDOUSER/bin/oc
chmod 755 /home/$SUDOUSER/bin/oc

# Install kubectl

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
 
echo $(date) " - Script Complete"

