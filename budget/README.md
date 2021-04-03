# Budget

[<- Back](../README.md)

An AWS Budget.

## Example

```terraform
module "budget" {
  source = "git::github.com/wurde/terraform-modules//budget"

  budget_type   = "COST"
  limit_amount  = "1500"
  emails        = ["andy@widgetco.com", "aws-billing@widgetco.com"]
}
```
