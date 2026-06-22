📘 Multi‑Region Azure VNet Architecture 
This project demonstrates a multi‑region Azure Virtual Network (VNet) architecture designed for high availability, redundancy, and cross‑region connectivity. It is a foundational cloud engineering project that showcases core Azure networking skills.

🌍 Architecture Overview
This solution deploys:

Two Azure regions (e.g., UK South + UK West)

One VNet per region

One Subnet per VNet

One VM per region

NSGs applied to each VM

VNet Peering between regions

This architecture supports:

Cross‑region communication

Redundancy

Disaster recovery

Multi‑region workloads

The full diagram is available in:
architecture/vnet-global-architecture.mmd

🏗 Components
1. Virtual Networks
VNet1 (Region 1)

VNet2 (Region 2)

2. Subnets
Subnet1

Subnet2

3. Virtual Machines
VM1 (Region 1)

VM2 (Region 2)

4. Network Security Groups
NSG1

NSG2

5. VNet Peering
Region1 ↔ Region2

Enables cross‑region traffic

🚀 Deployment Steps (Azure CLI)

1. Create Resource Groups

az group create -n rg-region1 -l uksouth
az group create -n rg-region2 -l ukwest

2. Create VNets

az network vnet create -g rg-region1 -n vnet1 --address-prefix 10.0.0.0/16 --subnet-name subnet1 --subnet-prefix 10.0.1.0/24
az network vnet create -g rg-region2 -n vnet2 --address-prefix 10.1.0.0/16 --subnet-name subnet2 --subnet-prefix 10.1.1.0/24

3. Peer the VNets

az network vnet peering create -g rg-region1 -n vnet1-to-vnet2 --vnet-name vnet1 --remote-vnet vnet2-id --allow-vnet-access
az network vnet peering create -g rg-region2 -n vnet2-to-vnet1 --vnet-name vnet2 --remote-vnet vnet1-id --allow-vnet-access

4. Deploy VMs

az vm create -g rg-region1 -n vm1 --image UbuntuLTS --vnet-name vnet1 --subnet subnet1
az vm create -g rg-region2 -n vm2 --image UbuntuLTS --vnet-name vnet2 --subnet subnet2

🔐 Security
NSGs restrict inbound traffic

SSH allowed only from your IP

VMs placed in isolated subnets

No public exposure unless required

📄 Documentation
Additional documentation is available in:
docs/overview.md

🎯 Learning Outcomes
By completing this project, you demonstrate:

Azure networking fundamentals

Multi‑region architecture design

VNet peering configuration

Secure VM deployment

Infrastructure documentation

Real‑world cloud engineering workflow

🧩 Next Steps
Enhance this project by adding:

Azure Bastion

Private DNS Zones

Load Balancer

Hub‑and‑Spoke topology
