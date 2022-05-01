#! /bin/bash
yc compute image delete monitoring
packer build -force -var-file=variables.json deploy_monitoring.json
terraform apply -auto-approve
