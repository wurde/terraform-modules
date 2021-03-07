resource "aws_lambda_function" "s3_concat" {
  function_name = "s3_concat"

  role     = aws_iam_role.s3_rw.arn
  filename = "s3-concat.zip"
  handler  = "exports.main"
  runtime  = "go1.x"
  timeout  = 10
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  principal     = "s3.amazonaws.com"
  function_name = aws_lambda_function.s3_concat.arn
  source_arn    = data.aws_s3_bucket.target.arn
}
