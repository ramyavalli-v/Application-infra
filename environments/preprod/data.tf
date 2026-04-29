data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = "c3ops-terraform-state-133630512742-ap-south-1-an"
    key    = "core-infra/ap-south-1/terraform.tfstate"
    region = var.region
  }
}

data "aws_caller_identity" "current" {}