data "aws_s3_bucket" "target" {
  bucket = var.s3_bucket_name
}

# resource "aws_s3_bucket_notification" "trigger" {
#   bucket = data.aws_s3_bucket.target.id

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.s3_concat.arn

#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = var.s3_input_prefix
#     filter_suffix = var.s3_input_suffix
#   }

#   depends_on = [aws_lambda_permission.allow_bucket]
# }
