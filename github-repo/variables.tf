variable "name" {
  type        = string
  description = "The name of the repository."
}

variable "description" {
  type        = string
  description = "A description of the repository."
  default     = ""
}

variable "visibility" {
  type        = string
  description = "Can be public or private."
  default     = "private"

  validation {
    condition     = var.visibility == "public" || var.visibility == "private"
    error_message = "Can only be 'public' or 'private'."
  }
}

variable "has_issues" {
  type        = bool
  description = "Enable the GitHub Issues feature."
  default     = false
}

variable "is_template" {
  type        = bool
  description = "This is a template repository."
  default     = false
}

variable "gitignore_template" {
  type        = string
  description = "Automatically add a .gitignore file. Template name without extension: https://github.com/github/gitignore"
  default     = "Terraform"
}

variable "license_template" {
  type        = string
  description = "Automatically add a LICENSE file. Template name without extension: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses"
  default     = "mit"
}

variable "topics" {
  type        = list(string)
  description = "List of topics."
  default     = []
}
