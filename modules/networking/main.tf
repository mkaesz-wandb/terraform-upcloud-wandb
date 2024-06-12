resource "upcloud_router" "wandb" {
  name = "${var.namespace}-router"
}

resource "upcloud_network" "wandb" {
  name = "${var.namespace}-network"
  zone = var.zone

  ip_network {
    address = "172.16.2.0/24"
    dhcp    = true
    family  = "IPv4"
    dhcp_default_route = true
  }

  router = upcloud_router.wandb.id
}

resource "upcloud_gateway" "wandb" {
  name     = "${var.namespace}-nat-gateway"
  zone     = var.zone
  features = ["nat"]

  router {
    id = upcloud_router.wandb.id
  }
}
