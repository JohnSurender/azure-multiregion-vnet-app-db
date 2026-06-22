#!/bin/bash

# Create Resource Groups for Multi-Region Deployment
echo "Creating Resource Groups..."

az group create -n rg-region1 -l uksouth
az group create -n rg-region2 -l ukwest

echo "Resource Groups created successfully."
