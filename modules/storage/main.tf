resource "random_string" "master_password" {
  length  = 32
  special = false
}

locals {
  database_name = "wandb_local"

  username = "wandb"
  password = random_string.master_password.result
}

resource "upcloud_object_storage" "wandb" {
  size        = 250            
  name        = "${var.namespace}"
  zone        = var.zone
  access_key  = local.username
  secret_key  = local.password
  description = "wandb"

  bucket {
    name = "${var.namespace}"
  }
}