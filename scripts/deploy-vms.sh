#!/bin/bash

echo "Deploying Virtual Machines in both regions..."

# Deploy VM in Region 1
az vm create \
  -g rg-region1 \
  -n vm1 \
  --image UbuntuLTS \
  --vnet-name vnet1 \
  --subnet subnet1 \
  --admin-username azureuser \
  --generate-ssh-keys

# Deploy VM in Region 2
az vm create \
  -g rg-region2 \
  -n vm2 \
  --image UbuntuLTS \
  --vnet-name vnet2 \
  --subnet subnet2 \
  --admin-username azureuser \
  --generate-ssh-keys

echo "VM deployment completed successfully."
