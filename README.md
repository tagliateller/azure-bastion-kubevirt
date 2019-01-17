# azure-bastion

az login --service-principal -u http://changeme -p password_changeme --tenant changeme

az group create --name changeme --location eastus

vi azuredeploy.parameters.json

az group deployment create -g changeme --name changeme --template-uri https://raw.githubusercontent.com/tagliateller/azure-bastion/azuredeploy.json --parameters @./azuredeploy.parameters.json

az group delete -y --name changeme

# Parameters

vi azuredeploy.parameters.json

        "sshPublicKey": {
            "value": "ssh-rsa AA...ZZ vagrant@localhost.localdomain"
        }
        
# KubeVirt

https://kubevirt.io/get_kubevirt/
# AWS 

https://github.com/openshift/openshift-ansible/tree/release-3.11/playbooks/aws

#$ oc login -u system:admin
#$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-privileged
#$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-controller
#$ oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-apiserver


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

## Origin 3.9 on Azure

curl -OL https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar zxvf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
./oc login https://masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com --token=[TOKEN]

[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$ ./oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-privileged
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-privileged"]
[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$ ./oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-controller
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-controller"]
[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$ ./oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-apiserver
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-apiserver"]

[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$ export VERSION=v0.11.0
[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$ ./oc apply -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt.yaml
service/kubevirt-prometheus-metrics created
clusterrole.rbac.authorization.k8s.io/kubevirt.io:admin created
clusterrole.rbac.authorization.k8s.io/kubevirt.io:edit created
clusterrole.rbac.authorization.k8s.io/kubevirt.io:view created
serviceaccount/kubevirt-apiserver created
clusterrolebinding.rbac.authorization.k8s.io/kubevirt-apiserver created
clusterrolebinding.rbac.authorization.k8s.io/kubevirt-apiserver-auth-delegator created
rolebinding.rbac.authorization.k8s.io/kubevirt-apiserver created
role.rbac.authorization.k8s.io/kubevirt-apiserver created
clusterrole.rbac.authorization.k8s.io/kubevirt-apiserver created
clusterrole.rbac.authorization.k8s.io/kubevirt-controller created
serviceaccount/kubevirt-controller created
serviceaccount/kubevirt-privileged created
clusterrolebinding.rbac.authorization.k8s.io/kubevirt-controller created
clusterrolebinding.rbac.authorization.k8s.io/kubevirt-privileged-cluster-admin created
clusterrole.rbac.authorization.k8s.io/kubevirt.io:default created
clusterrolebinding.rbac.authorization.k8s.io/kubevirt.io:default created
service/virt-api created
deployment.extensions/virt-api created
deployment.extensions/virt-controller created
daemonset.extensions/virt-handler created
customresourcedefinition.apiextensions.k8s.io/virtualmachineinstances.kubevirt.io created
customresourcedefinition.apiextensions.k8s.io/virtualmachineinstancereplicasets.kubevirt.io created
customresourcedefinition.apiextensions.k8s.io/virtualmachineinstancepresets.kubevirt.io created
customresourcedefinition.apiextensions.k8s.io/virtualmachines.kubevirt.io created
customresourcedefinition.apiextensions.k8s.io/virtualmachineinstancemigrations.kubevirt.io created
[azureuser@bastion openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit]$

kubectl config set-credentials clusteradmin/masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com --username=clusteradmin --password=MtbDHM3aZBLuIHJ9QSum

kubectl config set-cluster masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com --insecure-skip-tls-verify=true --server=https://masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com

kubectl config set-context default/masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com/clusteradmin --user=clusteradmin/masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com --namespace=default --cluster=masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com

# 17.1.19

Using username "clusteradmin".
Authenticating with public key "imported-openssh-key"
Last login: Thu Jan 17 17:37:30 2019 from originpoc-master-0
[clusteradmin@originpoc-master-0 ~]$ sudo -i
[root@originpoc-master-0 ~]# oc get nodes
NAME                 STATUS    ROLES     AGE       VERSION
originpoc-infra-0    Ready     <none>    33m       v1.9.1+a0ce1bc657
originpoc-infra-1    Ready     <none>    33m       v1.9.1+a0ce1bc657
originpoc-infra-2    Ready     <none>    33m       v1.9.1+a0ce1bc657
originpoc-master-0   Ready     master    33m       v1.9.1+a0ce1bc657
originpoc-master-1   Ready     master    33m       v1.9.1+a0ce1bc657
originpoc-master-2   Ready     master    33m       v1.9.1+a0ce1bc657
originpoc-node-0     Ready     compute   33m       v1.9.1+a0ce1bc657
originpoc-node-1     Ready     compute   33m       v1.9.1+a0ce1bc657
[root@originpoc-master-0 ~]# kubectl create configmap -n kube-system kubevirt-config --from-literal debug.useEmulation=true
configmap "kubevirt-config" created
[root@originpoc-master-0 ~]# oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-privileged
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-privileged"]
[root@originpoc-master-0 ~]# oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-controller
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-controller"]
[root@originpoc-master-0 ~]# oc adm policy add-scc-to-user privileged -n kube-system -z kubevirt-apiserver
scc "privileged" added to: ["system:serviceaccount:kube-system:kubevirt-apiserver"]
[root@originpoc-master-0 ~]# export VERSION=v0.11.0
[root@originpoc-master-0 ~]# oc apply -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt.yaml
service "kubevirt-prometheus-metrics" created
clusterrole "kubevirt.io:admin" created
clusterrole "kubevirt.io:edit" created
clusterrole "kubevirt.io:view" created
serviceaccount "kubevirt-apiserver" created
clusterrolebinding "kubevirt-apiserver" created
clusterrolebinding "kubevirt-apiserver-auth-delegator" created
rolebinding "kubevirt-apiserver" created
role "kubevirt-apiserver" created
clusterrole "kubevirt-apiserver" created
clusterrole "kubevirt-controller" created
serviceaccount "kubevirt-controller" created
serviceaccount "kubevirt-privileged" created
clusterrolebinding "kubevirt-controller" created
clusterrolebinding "kubevirt-privileged-cluster-admin" created
clusterrole "kubevirt.io:default" created
clusterrolebinding "kubevirt.io:default" created
service "virt-api" created
deployment "virt-api" created
deployment "virt-controller" created
daemonset "virt-handler" created
customresourcedefinition "virtualmachineinstances.kubevirt.io" created
customresourcedefinition "virtualmachineinstancereplicasets.kubevirt.io" created
customresourcedefinition "virtualmachineinstancepresets.kubevirt.io" created
customresourcedefinition "virtualmachines.kubevirt.io" created
customresourcedefinition "virtualmachineinstancemigrations.kubevirt.io" created
[root@originpoc-master-0 ~]# curl -L -o virtctl \
>     https://github.com/kubevirt/kubevirt/releases/download/$VERSION/virtctl-$VERSION-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   617    0   617    0     0   2505      0 --:--:-- --:--:-- --:--:--  2508
100 36.9M  100 36.9M    0     0  47.9M      0 --:--:-- --:--:-- --:--:-- 99.0M
[root@originpoc-master-0 ~]# chmod +x virtctl
[root@originpoc-master-0 ~]# kubectl apply -f https://raw.githubusercontent.com/kubevirt/demo/master/manifests/vm.yaml
virtualmachine "testvm" created
[root@originpoc-master-0 ~]# kubectl get vms
NAME      AGE
testvm    14s
[root@originpoc-master-0 ~]# kubectl get vms
NAME      AGE
testvm    17s
[root@originpoc-master-0 ~]#

