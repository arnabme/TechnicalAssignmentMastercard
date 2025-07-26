variable "env" {
  description = "Environment name (dev/test/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS should be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for EKS control plane and node groups"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}
