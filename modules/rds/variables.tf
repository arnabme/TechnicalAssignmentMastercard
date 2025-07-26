variable "env" {
  type        = string
  description = "Environment (dev/test/prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for RDS"
}

variable "allowed_cidrs" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "CIDRs allowed to connect to the RDS instance"
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "db_username" {
  type        = string
  description = "Master username for the DB"
}

variable "db_password" {
  type        = string
  description = "Master password for the DB"
  sensitive   = true
}

variable "db_name" {
  type    = string
  default = "myappdb"
}

variable "port" {
  type    = number
  default = 3306
}

variable "multi_az" {
  type    = bool
  default = false
}
