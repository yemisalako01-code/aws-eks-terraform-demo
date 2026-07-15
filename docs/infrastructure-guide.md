# AWS EKS Infrastructure Guide

## Components
- EKS Cluster with encryption
- Fargate serverless profiles
- Prometheus/Grafana monitoring
- VPC with private subnets

## Deployment Steps
1. Run `terraform init`
2. Configure variables in `terraform.tfvars`
3. Run `terraform plan`
4. Run `terraform apply`