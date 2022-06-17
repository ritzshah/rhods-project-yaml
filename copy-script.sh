# This repository is to create frontend and backend for AI/ML Object Detection workload in OpenShift cluster
#!/usr/bin/bash
export USERNAME=user2
cd $HOME
#mkdir $HOME/rhods-project-yaml
git clone https://github.com/ritzshah/rhods-project-yaml.git
sed -i "s/user1/$USERNAME/g" $HOME/rhods-project-yaml/object-detection-rest-deployment.yaml
sed -i "s/user1/$USERNAME/g" $HOME/rhods-project-yaml/object-detection-app-git-deployment.yaml
for i in `cat list`; do oc delete  -f $i; done
oc start-build object-detection-rest --wait
oc start-build object-detection-app-git --wait
oc rollout restart deployment object-detection-rest
oc rollout restart deployment object-detection-app-git
