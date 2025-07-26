terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "eks/test/terraform.tfstate"
    region = "us-east-1"
  }
}
