# 3 - Tier Azure Architecture Using Terrafrom Over AzureDevOps

## What is three-tier architecture?
The three-tier architecture is a widely accepted software application design pattern that divides applications into three distinct and interconnected computing tiers: the presentation tier, which represents the user interface; the application tier, responsible for processing data; and the data tier, accountable for storing and managing application data..

## What is terraform?
Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language, or optionally JSON..

## Installation
- [Terraform](https://www.terraform.io/downloads.html)

## Problem Statement

1. Has one Virtual Network and Three dedicated subnets for each layer
2. Each Subnet Associated to dedicated Virtual Machine
3. Web-Layer VM - Support Traffic from Publich using Port 80
4. Second and DB Virtual Machine has specfic set of NSG rule inbuilt where the communciated happend between the Virtual Networks 
5. Code and Deployment is taken care by Terrafrom Opensource
6. Build and release will taken over Azure Devops and Respective Pipleine 
7. State file manged on Azure backend over a storage container 

## Deployment File 

Has configuraiton gile 'azure-pipleine.yaml . This file used to define a Continuous Integration and Continuous Deployment (CI/CD) pipeline in Azure DevOps. This file is used to define the build and deployment stages for an application, and includes tasks such as compiling code, running tests, and deploying the application to a target environment

### Steps

**Step 0** `terraform init`

The term "initialize" refers to the process of setting up a working directory that includes the necessary Terraform configuration files

**Step 1** `terraform plan`

The command is utilized to generate a comprehensive plan of action based on the Terraform configuration, outlining the specific changes that will be made to the infrastructure resources.

**Step 2** `terraform validate`

This command is designed to validate the configuration files in a specified directory, focusing solely on the configuration itself and not making any connections to remote services such as provider APIs or remote state

**Step 3** `terraform apply`

The "apply" command is utilized to implement the necessary changes and modifications needed to reach the desired state of the configuration as outlined in the Terraform files.
