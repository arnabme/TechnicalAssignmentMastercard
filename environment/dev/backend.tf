terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "eks/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
