# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "s3_rw" {
  description        = "Allow Lambda to read and write to an S3 Bucket."
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  inline_policy {
    name   = "S3ReadWrite"
    policy = jsonencode({
      Version   = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:ListBucket"]
          Effect   = "Allow"
          Resource = data.aws_s3_bucket.target.arn
        }, {
          Action   = ["s3:GetObject"]
          Effect   = "Allow"
          Resource = "${data.aws_s3_bucket.target.arn}${var.s3_input_prefix}/**/*${var.s3_input_suffix}"
        }, {
          Action = [
            "s3:GetObject",
            "s3:PutObject"
          ],
          Effect   = "Allow"
          Resource = "${data.aws_s3_bucket.target.arn}${var.s3_output_prefix}"
        }
      ]
    })
  }
}
