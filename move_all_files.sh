#!/bin/bash

declare -A namespaces


namespaces[0]="testing"
# namespaces[1]="demands1"
# namespaces[2]="demands2"
# namespaces[3]="demands3"

  sudo mkdir /home/ahmed/Maxab/project_move_env_script/testBash;
#  save all resources as file yaml

for key in ${namespaces[@]}; do

for item in $(kubectl get -n $key -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,job,cronjob)
do
echo $item
  sudo  mkdir -p /home/ahmed/Maxab/project_move_env_script/testBash/$key/$(dirname $item)
  sudo touch /home/ahmed/Maxab/project_move_env_script/testBash/$key/$item.yaml
  sudo chmod 777 /home/ahmed/Maxab/project_move_env_script/testBash/$key/$item.yaml
    kubectl get -n $key -o=yaml  $item >  /home/ahmed/Maxab/project_move_env_script/testBash/$key/$item.yaml

done
done


