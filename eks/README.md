# EKS for Kubernetes

[<- Back](../README.md)

Manage a Kubernetes configuration.

## Quickstart

```terraform
module "repo" {
  source = "git::github.com/wurde/terraform-modules//eks"
}
```

Initialize the Terraform config, plan changes, and apply.

```bash
terraform init
terraform plan
terraform apply
```
