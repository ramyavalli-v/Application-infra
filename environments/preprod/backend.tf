terraform {
  backend "s3" {
    bucket = "c3ops-terraform-state1"
    key    = "app-infra/preprod/terraform.tfstate"
    region = "ap-south-1"
  }
}