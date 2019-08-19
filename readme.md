### Container definitions

Use this module to create a json template for feeding into the ecs task definition. it uses templatefile which is only availabel in terraform version 12.

It supports environment variables and secret definitions.

## Usage

````bash
module "container-definition-file-web-test" {
  source             = "git::ssh://git@github.com:lffa/ecs-container-definitions.git?ref=master"
  repo_url           = "${module.service-ecr.ecr_repository_url[0]}:latest"
  web_app_name       = var.web_app_name
  region             = var.region
  env                = {"NODE_ENV"="production","REACT_APP_API_HOST"=var.api_endpoint}
  healthcheck_config = {"command"="exit 0","interval"=30,"retries"=3,"timeout"=5}
  secrets            = {"dbpass"=var.db_password_arn}
  port               = 80
}
````