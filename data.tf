data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = "c3ops-terraform-state1"
    key    = "core-infra/ap-south-1/terraform.tfstate"
    region = var.region
  }
}