Introduction

- create bash script to move files yaml from environment to anoher environment
- move yaml to all deployment and all services and all configmaps and all ingress 
- create tls files (crt,key) and create all secret sources 
- edit files and remove some of lines to available yaml_file reused 


create folder to environment files 
   -  its inside folders of namespaces 
   - namespaces folder contain deployment_files folder , svc_files folder , cm_files folder , ing_files folder , tls_files folder , 

   Ex :
      Staging 
            - demands1 
                -- deployment_files
                --  svc_files
                --  cm_files
                -- ...
            - demands2
               -- ...
            - demands3
                -- ...


details of Algorithm scripting
 1- ' move_dumbs_yaml.sh '
    - create folders and move all resources in its specific folder 
    - get all resource yaml
    - get all names of secret tls 
    - get all host name from files of ingress ??
    - create crt and key file and( attachment url ??)
    - create all namespaces
    - create all deployments
    - create all svc
    - create all cm 
    - new create   all secret-tls from files (crt and key)
    - create all ingress
    - creat all job and corn job  
