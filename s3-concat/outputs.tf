output "bucket" {
  value = data.aws_s3_bucket.target.bucket
}

output "input_prefix" {
  value = aws_s3_bucket_notification.trigger.filter_prefix
}

output "input_suffix" {
  value = aws_s3_bucket_notification.trigger.filter_suffix
}

output "output_prefix" {
  value = "TODO"
}
