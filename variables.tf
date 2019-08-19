variable "repo_url" {}

variable "cloudwatch_group_prefix" {}

variable "cloudwatch_group" {}

variable "app_name" {}

variable "region" {}

variable "env" {
  type        = any
  default     = null
  description = "Environment variables. Optional parameter"
}

variable "healthcheck_config" {
  type    = any
  default = null
  description = "Map with healthcheck config. Optional parameter"
}

variable "secrets" {
  type    = any
  default = null
  description = "Map with secrets. Optional parameter"
}

variable "port" {}