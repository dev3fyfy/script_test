#!/bin/bash

declare -A namespaces
declare -A path_namespace_folder


namespaces[0]="testing"
# namespaces[1]="testing2"
# namespaces[2]="testing3"
# namespaces[3]="testing4"



path_namespace_folder="/##path##/testBash"
  sudo mkdir $path_namespace_folder;



#  save all resources as file yaml

for key in ${namespaces[@]}; do

for item in $(kubectl get -n $key -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,job,cronjob)
do
echo $item
  sudo  mkdir -p $path_namespace_folder/$key/$(dirname $item)
  sudo touch $path_namespace_folder/$key/$item.yaml
  sudo chmod 777 $path_namespace_folder/$key/$item.yaml
    kubectl get -n $key -o=yaml  $item >  $path_namespace_folder/$key/$item.yaml

done
done


