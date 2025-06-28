# Terraform Skeleton for Pokémon AWS Stack

This repository contains a reusable Terraform configuration that spins up:

* An EC2 instance running a Pokémon demo app
* A DynamoDB table pre‑seeded with Bulbasaur
* IAM instance profile, SSH key pair, and security group

## Quick start

```bash
terraform init
terraform apply -auto-approve
```

## Destroy

```bash
terraform destroy -auto-approve
```

## Customization

Edit `terraform/variables.tf` to adjust region, instance type, table name, etc.
