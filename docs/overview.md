📄 Project Documentation — Multi‑Region Azure VNet Architecture
1. Overview
This project implements a multi‑region Azure Virtual Network architecture designed for high availability, redundancy, and cross‑region communication. It demonstrates core Azure networking concepts used in real enterprise environments.

2. Architecture Summary
The solution includes:

Two Azure regions (UK South & UK West)

One VNet per region

One Subnet per VNet

One VM per region

NSGs applied to each VM

Bidirectional VNet peering

This design supports:

Regional failover

Cross‑region workload distribution

Disaster recovery

Secure communication between VNets

The full diagram is available in:
architecture/vnet-global-architecture.mmd

3. Traffic Flow
VM1 in Region 1 can communicate with VM2 in Region 2 through VNet peering.

Traffic stays on the Azure backbone network (no public internet).

NSGs enforce inbound/outbound rules.

Subnets isolate workloads for security and segmentation.

4. Security Considerations
NSGs restrict inbound traffic to SSH only.

No public IPs are required if using Bastion or VPN.

VNet peering does not allow transitive routing.

Subnets are isolated to prevent lateral movement.

Azure backbone ensures encrypted, private communication.

5. Cost Estimation (Approx.)
Component	Quantity	Estimated Monthly Cost
VNets	2	Free
Subnets	2	Free
VMs (B1s)	2	~£10–£12 each
Disks	2	~£3–£4 each
VNet Peering	2	~£1–£2 total


Estimated total: ~£30–£35 per month
(Varies by region and VM size)

6. Troubleshooting
Issue: VMs cannot communicate across regions
Ensure VNet peering is configured in both directions

Check NSG inbound/outbound rules

Confirm address spaces do not overlap

Issue: SSH connection fails
Verify your public IP is allowed in NSG

Ensure VM has a public IP (if not using Bastion)

Regenerate SSH keys if needed

Issue: Deployment script errors
Make sure you ran create-resource-groups.sh first

Ensure Azure CLI is logged in:
az login

Check region names for typos

7. Future Enhancements
Add Azure Bastion for secure access

Add Private DNS Zones

Add Load Balancer for cross‑region failover

Convert scripts to Bicep or Terraform

Add monitoring with Azure Monitor
