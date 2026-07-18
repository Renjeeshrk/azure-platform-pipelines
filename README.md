# PR-Azure-Platform

> Enterprise Azure Infrastructure as Code (IaC) project built with **Terraform** and **Azure DevOps** to deploy a scalable **Hub-and-Spoke network architecture** across multiple environments.


# Project Overview

This repository contains reusable Terraform modules and Azure DevOps pipelines to provision Azure infrastructure following Infrastructure as Code (IaC) best practices.

The solution is designed to support multiple environments while maintaining a single source of truth for infrastructure code.

Current environments include:

- Platform (Shared Hub)
- Development
- Test

Each environment has its own Terraform state, variable files, and deployment pipeline while sharing common reusable modules.

---

# Architecture

```text
                    +----------------------+
                    |      Platform        |
                    |     (Hub Network)    |
                    +----------+-----------+
                               |
               ---------------------------------
               |                               |
      +--------+--------+             +--------+--------+
      |      Dev        |             |      Test       |
      |   Spoke VNet    |             |   Spoke VNet    |
      +-----------------+             +-----------------+
```

---

# Repository Structure

```text
PR-Azure-Platform
│
├── environments
│   ├── platform
│   ├── dev
│   └── test
│
├── modules
│   ├── virtual-network
│   ├── subnets
│   └── compute
│
├── azure-pipelines.yml
├── azure-pipelines-1.yml
├── Azure-pipeline-test.yaml
└── README.md
```

---

# Environment Structure

Each environment contains:

| File | Purpose |
|------|---------|
| backend.tf | Remote backend configuration |
| main.tf | Calls reusable Terraform modules |
| variables.tf | Variable declarations |
| outputs.tf | Terraform outputs |
| versions.tf | Terraform and provider versions |
| *.tfvars | Environment-specific configuration |

---

# Terraform Modules

The repository follows a modular design.

## virtual-network

Creates:

- Resource Group (optional)
- Virtual Network
- Address Space

---

## subnets

Creates:

- Application Subnets
- Database Subnets
- Gateway Subnet
- Azure Firewall Subnet
- Bastion Subnet

---

## compute

Deploys compute resources including:

- Virtual Machines
- Network Interfaces
- Availability Options

*(Additional modules such as NSG, Firewall, Route Tables, Bastion, Key Vault, and Monitoring can be added as the platform evolves.)*

---

# Deployment Workflow

```text
Developer
     │
     ▼
Git Commit
     │
     ▼
Azure Repos
     │
     ▼
Azure DevOps Pipeline
     │
     ├── terraform fmt
     ├── terraform validate
     ├── terraform init
     ├── terraform plan
     ├── Manual Approval
     └── terraform apply
     │
     ▼
Azure Infrastructure
```

---

# CI/CD Workflow

## 1. Code Commit

Infrastructure changes are committed to Azure Repos.

---

## 2. Terraform Format

```bash
terraform fmt
```

Ensures Terraform files follow standard formatting.

---

## 3. Terraform Validate

```bash
terraform validate
```

Checks configuration syntax and module references.

---

## 4. Terraform Init

```bash
terraform init
```

Initializes:

- Providers
- Backend
- Modules

---

## 5. Terraform Plan

```bash
terraform plan
```

Generates an execution plan showing proposed infrastructure changes.

---

## 6. Approval Gate

Before infrastructure changes are applied, Azure DevOps environment approvals can be used to require manual validation for protected environments.

---

## 7. Terraform Apply

```bash
terraform apply
```

Deploys the approved infrastructure into Azure.

---

# Environment Deployment Order

Recommended deployment sequence:

```text
Platform (Hub)
        │
        ▼
Development
        │
        ▼
Test
```

The shared Platform (Hub) environment should be deployed first, followed by the spoke environments.

---

# Remote State

Terraform state is stored remotely using Azure Storage.

Benefits include:

- State locking
- Team collaboration
- Centralized state management
- Improved reliability

Each environment uses an independent state file.

Example:

```text
platform.tfstate
dev.tfstate
test.tfstate
```

---

# Security

Sensitive information should **not** be stored in the repository.

Recommended approach:

- Azure DevOps Variable Groups
- Azure Key Vault
- Azure Service Connections
- Secret Variables

Examples of secrets:

- VM Passwords
- Administrator Credentials
- Storage Access Keys
- Connection Strings
- API Keys

---

# Naming Standards

Example naming convention:

| Resource | Example |
|----------|----------|
| Resource Group | rg-platform-hub-prod |
| Virtual Network | vnet-platform-hub |
| Subnet | snet-management |
| Network Security Group | nsg-web |
| Storage Account | stterraformstate01 |

---

# Prerequisites

- Azure Subscription
- Azure DevOps Project
- Azure Service Connection
- Terraform CLI
- Azure CLI
- Remote State Storage Account
- Self-hosted or Microsoft-hosted Agent

---


# Best Practices

- Use reusable Terraform modules.
- Keep environment-specific configuration separate.
- Store Terraform state remotely.
- Protect production deployments with approval gates.
- Use Azure Key Vault for secrets.
- Follow consistent naming standards.
- Review Terraform plans before applying.
- Use feature branches and Pull Requests for infrastructure changes.

---

# Future Enhancements

- Azure Firewall
- Azure Bastion
- Route Tables
- Network Security Groups
- Azure Private DNS
- Azure Key Vault
- Azure Monitor
- Log Analytics Workspace
- Azure Policy
- Defender for Cloud
- Virtual Machine Scale Sets
- GitHub Copilot integration
- Terraform MCP Server integration

---

# Technologies Used

- Microsoft Azure
- Terraform
- Azure DevOps
- Azure Repos
- Azure Pipelines
- Azure Storage
- Azure Key Vault
- Infrastructure as Code (IaC)

---

## License

This project is intended for learning, demonstration, and enterprise Infrastructure as Code implementation. Feel free to fork and adapt it to your own Azure environment..
