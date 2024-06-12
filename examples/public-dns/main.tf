terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 5.0"
    }
  }
}

provider "upcloud" {
  # username and password configuration arguments can be omitted  
  # if environment variables UPCLOUD_USERNAME and UPCLOUD_PASSWORD are set
  # username = ""
  # password = ""
}


module "wandb" {
  source = "../../"

  namespace             = var.namespace
  license               = var.license
  domain_name           = var.domain_name
  subdomain             = var.subdomain
  zone                  = var.zone
  deploy_nginx_ingress  = var.deploy_nginx_ingress
}


data "upcloud_kubernetes_cluster" "wandb" {
  id = module.wandb.cluster_id
}

provider "helm" {
  kubernetes {
    host                   = data.upcloud_kubernetes_cluster.wandb.host
    cluster_ca_certificate = data.upcloud_kubernetes_cluster.wandb.cluster_ca_certificate
    client_key                  = data.upcloud_kubernetes_cluster.wandb.client_key
    client_certificate = data.upcloud_kubernetes_cluster.wandb.client_certificate
  }
}

provider "kubernetes" {
  host                   = data.upcloud_kubernetes_cluster.wandb.host
    cluster_ca_certificate = data.upcloud_kubernetes_cluster.wandb.cluster_ca_certificate
    client_key                  = data.upcloud_kubernetes_cluster.wandb.client_key
    client_certificate = data.upcloud_kubernetes_cluster.wandb.client_certificate
  }




