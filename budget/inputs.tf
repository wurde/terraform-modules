variable "budget_type" {
  type        = string
  default     = "COST"
  description = "Whether this budget tracks COSTS, USAGE, RI_UTILIZATION, RI_COVERAGE, SAVINGS_PLANS_UTILIZATION, or SAVINGS_PLANS_COVERAGE."
}

variable "limit_amount" {
  type        = string
  default     = "100"
  description = "The amount of cost or usage being measured for a budget."
}

variable "time_period_start" {
  type        = string
  default     = "2021-01-01_00:00"
  description = "The start of the time period covered by the budget."
}

variable "time_unit" {
  type        = string
  default     = "MONTHLY"
  description = "The length of time until a budget resets: MONTHLY, QUARTERLY, ANNUALLY, and DAILY."
}

variable "emails" {
  type        = list(string)
  default     = []
  description = "List of email addresses to receive notifications."
}
