#!/bin/bash
function install_enviroment {
  cd terraform
  touch key.pem
  chmod 777 key.pem
  aws ssm get-parameter --name "key.pem" --with-decryption --output text --query Parameter.Value > key.pem
  terraform apply -auto-approve
  rm -rf ips.txt key.pem
  cd /home/ubuntu/DevSecOps-IaC/helper_scripts
  ./dynamic_inventory.sh
  cd /home/ubuntu/DevSecOps-IaC/ansible
  touch key.pem
  chmod 777 key.pem
  aws ssm get-parameter --name "key.pem" --with-decryption --output text --query Parameter.Value > key.pem
  chmod 0400 key.pem
  ansible-playbook apache.yml -i inventory -u ubuntu --private-key ./key.pem
  rm -rf key.pem inventory
}
for arg in "$@"; do
  if [[ "$arg" = --setup-enviroment ]]; then
     install_enviroment
  fi
  if [[ "$arg" = --destroy-enviroment ]]; then
     cd terraform
     terraform destroy 
  fi
  if [[ "$arg" = --plan-enviroment ]]; then
     cd terraform
     terraform plan
  fi
done 
