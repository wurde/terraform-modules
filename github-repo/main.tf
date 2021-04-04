# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "main" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  has_issues  = var.has_issues
  is_template = var.is_template

  gitignore_template = var.gitignore_template
  license_template   = var.license_template
  topics             = var.topics

  has_projects = false
  has_wiki     = false

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

  delete_branch_on_merge = true

  auto_init = true

  archive_on_destroy = true
}
