# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget
resource "aws_budgets_budget" "main" {
  # The name of a budget. Unique within accounts.
  name = var.name

  # (Required) What this budget tracks.
  #   USAGE | COST | RI_UTILIZATION | RI_COVERAGE |
  #   SAVINGS_PLANS_UTILIZATION | SAVINGS_PLANS_COVERAGE
  budget_type = var.budget_type

  # (Required) The amount of cost or usage being measured for a budget.
  limit_amount = var.limit_amount

  # (Required) The unit of measurement used for the
  # budget forecast, actual spend, or budget threshold,
  # such as USD or GB.
  limit_unit = "USD"

  # (Required) The start of the time period covered by
  # the budget. The start date must come before the
  # end date. Format: 2017-01-01_12:00.
  time_period_start = var.time_period_start

  # (Required) The length of time until a budget resets
  # the actual and forecasted spend. Valid values:
  # MONTHLY, QUARTERLY, ANNUALLY, and DAILY.
  time_unit = var.time_unit


  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.emails
  }
}
