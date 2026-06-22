#!/bin/bash

echo "Deploying VNets and Subnets..."

# Create VNets
az network vnet create \
  -g rg-region1 \
  -n vnet1 \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet1 \
  --subnet-prefix 10.0.1.0/24

az network vnet create \
  -g rg-region2 \
  -n vnet2 \
  --address-prefix 10.1.0.0/16 \
  --subnet-name subnet2 \
  --subnet-prefix 10.1.1.0/24

echo "VNets created."

# Get VNet IDs
VNET1_ID=$(az network vnet show -g rg-region1 -n vnet1 --query id -o tsv)
VNET2_ID=$(az network vnet show -g rg-region2 -n vnet2 --query id -o tsv)

echo "Creating VNet Peering..."

# Create VNet peering
az network vnet peering create \
  -g rg-region1 \
  -n vnet1-to-vnet2 \
  --vnet-name vnet1 \
  --remote-vnet $VNET2_ID \
  --allow-vnet-access

az network vnet peering create \
  -g rg-region2 \
  -n vnet2-to-vnet1 \
  --vnet-name vnet2 \
  --remote-vnet $VNET1_ID \
  --allow-vnet-access

echo "VNet peering completed successfully."
