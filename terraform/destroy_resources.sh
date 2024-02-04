#! /usr/bin/bash

destroy_resources () {
    terraform init
    terraform destroy -auto-approve
}


cd ./vm
destroy_resources
cd ../container_registry
destroy_resources
cd ../network
destroy_resources
