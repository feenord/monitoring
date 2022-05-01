#! /bin/bash
yc compute image delete crawler
packer build -force -var-file=variables.json deploy_monitoring.json
terraform apply -auto-approve
