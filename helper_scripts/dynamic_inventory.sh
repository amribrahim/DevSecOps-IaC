cd ../terraform
sudo touch ips.txt
sudo chmod 777 ips.txt
terraform output > ips.txt
sudo touch inventory
sudo chmod 777 inventory
awk '{print $3}' ips.txt | tr -d \" > inventory     #print only ip's
sudo sed  -i '1i [servers]' inventory               # add server to first line
sudo mv inventory ../ansible/inventory



# ansible-playbook apache.yml -i inventory -u ubuntu --private-key ./key.pem this command to run the playbook



