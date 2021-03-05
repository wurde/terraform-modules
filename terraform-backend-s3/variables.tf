# Define input variables.

variable "bucket_name" {
  type        = string
  description = "The name of the bucket."
}

variable "role_name" {
  type        = string
  description = "The name of the IAM role."
}

variable "tags" {
  type        = map(string)
  description = "Specifies object tags key and value."
  default     = {}
}
