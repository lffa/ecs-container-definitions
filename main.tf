
locals {
  env_json_blk = var.env == null ? "" : <<EOF
          %{for i in slice(keys(var.env), 0, length(var.env) - 1)}
          {
            "name": "${i}",
            "value":"${lookup(var.env, i)}"
          },
          %{endfor}
          {
            "name": "${keys(var.env)[length(var.env) - 1]}",
            "value":"${lookup(var.env, keys(var.env)[length(var.env) - 1])}"
          }
          EOF

  secrets_json_blk = var.secrets == null ? "" : <<EOF
          %{for i in slice(keys(var.secrets), 0, length(var.secrets) - 1)}
          {
           "name": "${i}",
           "valueFrom":"${lookup(var.secrets, i)}"
          },
          %{endfor}
          {
            "name": "${keys(var.secrets)[length(var.secrets) - 1]}",
            "valueFrom":"${lookup(var.secrets, keys(var.secrets)[length(var.secrets) - 1])}"
          }
          EOF
  healthcheck_json_blk= var.healthcheck_config == null ? "" : <<EOF
         "healthCheck":
         {
           "command":["CMD-SHELL","${lookup(var.healthcheck_config, "command")}"],
           "interval":${lookup(var.healthcheck_config, "interval")},
           "retries":${lookup(var.healthcheck_config, "retries")},
           "timeout":${lookup(var.healthcheck_config, "timeout")}
         },
         EOF
}
