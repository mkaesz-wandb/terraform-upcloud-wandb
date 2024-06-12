resource "random_string" "master_password" {
  length  = 32
  special = false
}

locals {
  database_name = "wandb_local"

  master_username = "wandb"
  master_password = random_string.master_password.result

  master_instance_name = "${var.namespace}"
}


resource "upcloud_managed_database_mysql" "wandb" {
  name  = local.master_instance_name
  title = local.master_instance_name
  plan  = "1x1xCPU-2GB-25GB"
  zone  = var.zone

  network {
    family = "IPv4"
    name   = "WandB-network"
    type   = "private"
    uuid   = var.network
  }

  properties {
    sql_mode           = "NO_ENGINE_SUBSTITUTION"
    admin_username     = local.master_username
    admin_password     = local.master_password
  }
}

resource "upcloud_managed_database_logical_database" "wandb" {
  service = upcloud_managed_database_mysql.wandb.id
  name    = local.database_name
}