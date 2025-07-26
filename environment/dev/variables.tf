variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "env" {
  default     = "dev"
  description = "Environment name"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for VPC"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "Availability Zones"
}

variable "db_username" {
  description = "Database username"
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  default     = "devdb"
}

variable "allowed_cidrs" {
  description = "CIDRs allowed to access RDS and EFS"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  default     = "1.29"
}
