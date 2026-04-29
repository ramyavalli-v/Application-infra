terraform {
  backend "s3" {
    bucket = "c3ops-terraform-state-133630512742-ap-south-1-an"
    key    = "app-infra/preprod/terraform.tfstate"
    region = "ap-south-1"
  }
}