

#filter tls-secret and create tls certification(crt , key)
declare -A namespaces
declare -A path_namespace_folder


namespaces[0]="testing"

for key in ${namespaces[@]}; do

for item in $(kubectl get ing -n $key -o=name )
do
echo $item

all_hosts= kubectl get ing example-ingress -o custom-columns=HOSTS:.spec.tls

# split space host and tls name
arr=($all_hosts)
read -a arr <<< $all_hosts

for s in "${arr[@]}"; do 
    echo "$s"
    #  echo "$item" | sed 's@secret/@@'
done

#### processing of extract tls-name and hosts
   
### create files crt and key by name of 'tls-name' and add hosts 
   
 # openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=anthonycornell.com/O=anthonycornell.com"

  

done
done
