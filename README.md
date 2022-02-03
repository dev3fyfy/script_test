Introduction

- create bash script to move files yaml from environment to anoher environment
- move yaml to all deployments and all services and all configmaps and all ingress and put in folder according to namespace
- get tls-name from ingress file and create tls files (crt,key) then create all secret sources 
- edit files and remove some of lines to available yaml_file reused 
- create all The rest of resources 


create folder to environment files 
   -  its inside folders of namespaces 
   - namespaces folder contain deployment_files folder , svc_files folder , cm_files folder , ing_files folder , tls_files folder , 

Ex :
1. Staging 
   - first_namespace
     - deployment_files
     - svc_files
     -  cm_files
     - ...
   - second_namespace
     - ...
   - third_namespace
     - ...


Details of Algorithm scripting

- [move_all_files.sh](https://github.com/dev3fyfy/script_test/blob/master/move_all_files.sh) , it's working
- create folders and move all resources in its specific folder 
- get all resource yaml
- [filter_hosts_create_tls.sh](https://github.com/dev3fyfy/script_test/blob/master/filter_hosts_create_tls.sh) , in process
- get all names of secret tls 
- get all host name from files of ingress ??
- create crt and key file and( attachment url ??)
- new create   all secret-tls from files (crt and key)
- create all ingress
- create all namespaces
- create all deployments
- create all svc
- create all cm 
- creat all job and corn job  
