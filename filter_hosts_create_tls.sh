

#filter tls-secret and create tls certification(crt , key)
declare -A namespaces
declare -A path_namespace_folder


namespaces[0]="testing"
path_namespace_folder="/home/ahmed/Maxab/project_move_env_script/testBash"

for key in ${namespaces[@]}; do

for item in $(kubectl get secret -n $key -o=name )
do

if [[ $item == *"tls"* ]]; then
sudo  mkdir -p  $path_namespace_folder/$key/$(dirname $item)/file_certificate

     tls_name=$(echo $item | sed 's@secret/@@')
echo "it's tls $item"
echo "it's tls $tls_name"
 sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $path_namespace_folder/$key/$(dirname $item)/file_certificate/$tls_name.key -out $path_namespace_folder/$key/$(dirname $item)/file_certificate/$tls_name.crt -subj "/CN=Country_Name/O=organizationName"

fi
  

done
done
