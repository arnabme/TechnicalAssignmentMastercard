variable "env" {
  description = "Environment name (dev/test/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "allowed_cidrs" {
  description = "List of CIDRs allowed to access EFS"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
