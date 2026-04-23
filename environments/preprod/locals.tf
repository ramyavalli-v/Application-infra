locals {
  env = var.environments[var.environment]

  common_tags = merge(
    local.env.tags,
    {
      Application = "Cloud-Binary"
      ManagedBy   = "Terraform"
    }
  )
}