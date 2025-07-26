variable "env" {
  type        = string
  description = "Environment (dev, test, prod)"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}
