variable "s3_bucket_name" {
  type        = string
  description = "Name of the bucket."
}

variable "s3_input_prefix" {
  type        = string
  description = "The prefix containing input objects."
}

variable "s3_input_suffix" {
  type        = string
  description = "The target suffix."
}

variable "s3_output_prefix" {
  type        = string
  description = "The destination prefix."
}
