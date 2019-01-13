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
