# GitHub Repository

[<- Back](../README.md)

An GitHub Repository.

## Example

```terraform
module "repo" {
  source = "git::github.com/wurde/terraform-modules//github-repo"

  name = "example"

  visibility = "public"
}
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
