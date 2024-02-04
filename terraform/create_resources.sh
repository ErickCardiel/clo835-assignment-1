#! /usr/bin/bash

provision_resources () {
    terraform init
    terraform fmt
    tf_validate=$(terraform validate)
    if [[ $tf_validate == *"Success"* ]]
      then
        tf_plan_status=$(terraform plan -detailed-exitcode)
        echo $tf_plan_status
        if [[ $tf_plan_status != *"Planning Failed"* ]]
          then terraform apply -auto-approve
          else echo "Terraform plan failed"
        fi
      else echo "Terraform validate failed"
    fi
}


cd ./network
provision_resources
cd ../container_registry
provision_resources
cd ../vm
provision_resources