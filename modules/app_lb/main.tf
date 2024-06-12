resource "upcloud_loadbalancer_dynamic_certificate_bundle" "wandb" {
  name = "wandb-gcp-msk-pub"
  hostnames = [
    "wandb.gcp.msk.pub",
  ]
  key_type = "rsa"
}

resource "kubernetes_service" "service" {
  metadata {
    name = "wandb-lb"
    
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "wandb"
    }
    port {
      name      = "http"
      port      = 80
      target_port = 8080
    }

    port {
      name      = "https"
      port      = 443
      target_port= 8080
    }
  }
}
