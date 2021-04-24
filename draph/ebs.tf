# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume
# resource "aws_ebs_volume" "example" {
#   availability_zone = "us-west-2a"
#
#   # The type of EBS volume.
#   type = "gp3"
#
#   # The size of the drive in GiBs.
#   size = var.ebs_volume_size
#
#   # The amount of IOPS to provision for the disk.
#   iops = var.ebs_volume_iops
#
#   # The throughput that the volume supports, in MiB/s.
#   throughput = var.ebs_volume_throughput
# }
