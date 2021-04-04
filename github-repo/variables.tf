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
  default     = "public"

  validation {
    condition     = var.visibility == "public" || var.visibility == "private"
    error_message = "Can only be 'public' or 'private'."
  }
}
