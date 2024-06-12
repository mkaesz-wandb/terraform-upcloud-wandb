resource "upcloud_managed_database_redis" "wandb" {
  name  = "${var.namespace}"
  title = "${var.namespace}"
  plan  = "1x1xCPU-2GB"
  zone  = var.zone

  properties {
    public_access = false
  }

  network {
    family = "IPv4"
    name   = "WandB-network"
    type   = "private"
    uuid   = var.network
  }
}