#!/bin/bash

declare -A namespaces


namespaces[0]="default"
namespaces[1]="demands1"
namespaces[2]="demands2"
namespaces[3]="demands3"

  mkdir /root/testBash;

for key in ${namespaces[@]}; do

for item in $(kubectl get -n $key -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,statefulset,hpa,job,cronjob)
do
echo $item
    mkdir -p /root/testBash/$key/$(dirname $item)
    kubectl get -n $key -o=yaml  $item > /root/testBash/$key/$item.yaml
done
done

#############

declare -A namespaces
declare -A  namespace
declare -A  deploy_name
declare -A  count_lines_file
declare -A  count
declare -A  path_namespace_folder

namespaces[0]="default"
namespaces[1]="demands1"
namespaces[2]="demands2"
namespaces[3]="demands3"


move_deployment_dump () {

    mkdir /root/testBash/$namespace/deployments_files;

    $(kubectl get deploy -n $namespace |  awk '{print $1}' | tail -n +2 ) > /root/testBash/$namespace/deployments_files/list_deployments
#  echo "$list" > /root/testBash/$namespace/deployments_files/list_deployments
  
  count_lines_file= wc -l < /root/testBash/$namespace/deployments_files/list_deployments


#for count in $count_lines_file 

   count=1;
while [ $count -lt $count_lines_file ] ; do
 deploy_name= awk 'NR==v1' v1="${count}" /root/testBash/$namespace/deployments_files/list_deployments
echo "deploy_name $deploy_name";
echo "count $count"
echo "  kubectl get deploy $deploy_name -n $namespace"
  $(kubectl get deploy $deploy_name -n $namespace -o yaml ) >  /root/testBash/$namespace/deployments_files/${deploy_name}.yaml

  count=$(( $count + 1))

done


 }

   mkdir /root/testBash;

for key in ${namespaces[@]}; do 
namespace=$key;

    mkdir  /root/testBash/$namespace;
move_deployment_dump ;

done 


