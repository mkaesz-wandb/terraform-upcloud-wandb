resource "upcloud_kubernetes_cluster" "wandb" {
  # Allow access to the cluster control plane from any external source.
  control_plane_ip_filter = ["0.0.0.0/0"]
  name                    = "wandb"
  network                 = var.network
  zone                    = var.zone
  private_node_groups     = true
}

resource "upcloud_kubernetes_node_group" "group" {
  cluster    = resource.upcloud_kubernetes_cluster.wandb.id
  node_count = 2
  name       = "small"
  plan       = "4xCPU-8GB"
}


resource "helm_release" "ingress-nginx" {
  count = var.deploy_nginx_ingress ? 1 : 0

  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.8.3"
  namespace  = "ingress-nginx"
  create_namespace = true

  values = [
    <<-EOT
    controller:
      hostNetwork: true
      replicaCount: 2
    service:
      type: NodePort
    EOT
  ]
}

