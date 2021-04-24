variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region."
}

variable "ebs_volume_size" {
  type        = number
  default     = 200
  description = "The size of the drive in GiBs."
}

variable "ebs_volume_iops" {
  type        = number
  default     = 3000
  description = "The amount of IOPS to provision for the disk."
}

variable "ebs_volume_throughput" {
  type        = number
  default     = 125
  description = "The throughput that the volume supports, in MiB/s."
}
