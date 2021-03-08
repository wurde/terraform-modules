# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
resource "aws_lambda_function" "s3_concat" {
  function_name = "s3_concat"
  role          = aws_iam_role.s3_rw.arn
  description   = "Concatenates S3 object data."

  filename         = "s3-concat.zip"
  source_code_hash = filebase64sha256("s3-concat.zip")

  handler = "exports.main"
  runtime = "go1.x"
  timeout = 10

  environment {
    variables = {
      S3_BUCKET_NAME   = var.s3_bucket_name
      S3_OUTPUT_PREFIX = var.s3_output_prefix
    }
  }
}

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission
# resource "aws_lambda_permission" "allow_bucket" {
#   statement_id  = "AllowExecutionFromS3Bucket"
#   action        = "lambda:InvokeFunction"
#   principal     = "s3.amazonaws.com"
#   function_name = aws_lambda_function.s3_concat.arn
#   source_arn    = data.aws_s3_bucket.target.arn
# }
