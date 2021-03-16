# Terraform Backend S3

[<- Back](../README.md)

Terraform module that configures an S3 Bucket to use
for managing remote state.

## Getting started

The module requires an S3 Bucket name. It must be
globally unique. Optionally you can add `tags`.

```terraform
module "terraform-backend-s3" {
  source = "git::github.com/wurde/terraform-modules//terraform-backend-s3"

  bucket_name = "my-terraform-backend"
}
```

Below shows configuring Terraform with the S3 Backend.

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.31.0"
    }
  }

  # https://www.terraform.io/docs/backends/types/s3.html
  backend "s3" {
    bucket = "my-terraform-backend"
    region = "us-east-1"
  }

  required_version = ">= 0.14"
}
```

## License

This project is __FREE__ to use, reuse, remix, and resell.
This is made possible by the [MIT license](/LICENSE).
