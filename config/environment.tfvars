environments = {
  preprod = {
    instance_type     = "t3.micro"
    desired_capacity  = 2
    min_size          = 1
    max_size          = 3

    db_instance_class = "db.t3.micro"

    domain_name       = "c3ops-preprod.com"
    s3_bucket_name    = "preprod-app-assets-123"

    tags = {
      Environment = "preprod"
      Project     = "C3Ops"
      ManagedBy   = "Terraform"
    }
  }

  prod = {
    instance_type     = "t3.medium"
    desired_capacity  = 3
    min_size          = 3
    max_size          = 6

    db_instance_class = "db.t3.medium"

    domain_name       = "app.example.com"
    s3_bucket_name    = "prod-app-assets-123"

    tags = {
      Environment = "prod"
      Project     = "C3Ops"
      ManagedBy   = "Terraform"
    }
  }
}