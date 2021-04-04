# GitHub Repository

[<- Back](../README.md)

A GitHub repository.

## Example

```terraform
module "repo" {
  source = "git::github.com/wurde/terraform-modules//github-repo"

  name        = "example"
  description = "My example repo."
  visibility  = "private"
}
```

Provider configuration:

```terraform
// ./terraform.tf
terraform {
  required_version = "~> 0.14"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.6"
    }
  }
}

// ./providers.tf
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

// ./variables.tf
variable "github_token" {
  type        = string
  description = "A GitHub OAuth / Personal Access Token."
}

variable "github_owner" {
  type        = string
  description = "This is the target GitHub individual account to manage."
}

// ./terraform.tfvars
github_token = "ghp_05f60ba25a20f67f442f4127e4d6c4dd"
github_owner = "wurde"
```

## Resources

- github_repository
- github_branch
- github_branch_default
- github_branch_protection
- github_repository_file
- github_repository_collaborator
- github_user_invitation_accepter
- github_actions_secret
- github_repository_webhook
- github_issue_label

## Variables

**Required**

| Name | Description | Type |
| :--  | :--         | :--  |
| name | The name of the repository. | string

**Optional**

| Name | Description | Type | Default |
| :--  | :--         | :--  | :--     |
| description | A description of the repository. | string | "" |
| visibility | Can be public or private. | string | "public" |
