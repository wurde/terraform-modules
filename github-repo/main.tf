# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "main" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
}
