git clone https://github.com/jbossdemocentral/coolstore-microservice.git

[azureuser@bastion ~]$ cd coolstore-microservice/
[azureuser@bastion coolstore-microservice]$ git status
# On branch stable-ocp-3.10
nothing to commit, working directory clean
[azureuser@bastion coolstore-microservice]$ git branch -a
* stable-ocp-3.10
  remotes/origin/1.0.x
  remotes/origin/1.1.x
  remotes/origin/1.2.x
  remotes/origin/HEAD -> origin/stable-ocp-3.10
  remotes/origin/hibernate-ogm
  remotes/origin/master
  remotes/origin/ocp-3.11
  remotes/origin/stable-ocp-3.10
  remotes/origin/stable-ocp-3.11
  remotes/origin/stable-ocp-3.3
  remotes/origin/stable-ocp-3.4
  remotes/origin/stable-ocp-3.5
  remotes/origin/stable-ocp-3.6
  remotes/origin/stable-ocp-3.7
  remotes/origin/stable-ocp-3.9
  remotes/origin/tqvarnst-coolstore-readme-patch
[azureuser@bastion coolstore-microservice]$ git checkout -b stable-ocp-3.9 origin/stable-ocp-3.9
Branch stable-ocp-3.9 set up to track remote branch stable-ocp-3.9 from origin.
Switched to a new branch 'stable-ocp-3.9'
[azureuser@bastion coolstore-microservice]$

https://masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com/console

oc login https://masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com -u clusteradmin

[azureuser@bastion coolstore-microservice]$ oc new-project coolstore
Now using project "coolstore" on server "https://masterdnscqhm7zubc42t4.eastus.cloudapp.azure.com:443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-25-centos7~https://github.com/sclorg/ruby-ex.git

to build a new example application in Ruby.
[azureuser@bastion coolstore-microservice]$

oc adm policy add-role-to-user admin developer -n coolstore



