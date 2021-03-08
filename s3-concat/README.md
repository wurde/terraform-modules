# S3 Concat

[<- Back](../README.md)

Automate the concatenation of files within S3.

## Example

```terraform
module "s3-concat" "intraday-call-metrics" {
  source = "github.com/wurde/terraform-modules/s3-concat"

  s3_bucket_name   = "amazon-connect-reports"
  s3_input_prefix  = "/connect/Reports/IntradayCallMetrics"
  s3_input_suffix  = ".csv"
  s3_output_prefix = "/quicksight/Reports/IntradayCallMetrics-1.csv"
}
```
