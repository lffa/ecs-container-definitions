output "container_definition" {
  value = templatefile("${path.module}/container-definition.json",
    {
      env                     = local.env_json_blk
      cloudwatch_group        = var.cloudwatch_group
      cloudwatch_group_prefix = var.cloudwatch_group_prefix
      app_name                = var.app_name,
      repo_url                = var.repo_url,
      region                  = var.region
      healthcheck_json_blk    = "${local.healthcheck_json_blk}"
      secrets                 = local.secrets_json_blk
      port                    = var.port
    }
  )
}