terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "eks/prod/terraform.tfstate"
    region = "us-east-1"
  }
}
