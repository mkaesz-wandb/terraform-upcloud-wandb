module "networking" {
  source     = "./modules/networking"
  namespace  = var.namespace
  zone       = var.zone
}

module "storage" {
  source    = "./modules/storage"
  namespace = var.namespace
  zone      = var.zone
  network   = module.networking.network
}

module "database" {
  source     = "./modules/database"
  namespace  = var.namespace
  network    = module.networking.network
  zone       = var.zone
}

module "app_uks" {
  source               = "./modules/app_uks"
  namespace            = var.namespace
  network              = module.networking.network
  zone                 = var.zone
  deploy_nginx_ingress = var.deploy_nginx_ingress
}

module "app_lb" {
  source     = "./modules/app_lb"
  namespace  = var.namespace
  network    = module.networking.network
  zone       = var.zone
  fqdn       = local.fqdn
}

#module "redis" {
#  source     = "./modules/redis"
#  namespace  = var.namespace
#  network    = module.networking.network
#  zone       = var.zone
#}


locals {
  other_envs = {
 #   "BUCKET" = module.storage.bucket_connection_string
  #  "MYSQL" = module.database.connection_string
  #  "REDIS" = module.redis.connection_string
    # Fake value. no meaning.
    "AWS_REGION" = "var-must-be-set-despite-not-needed"
  }
  env_vars = merge(
    local.other_envs,
    var.other_wandb_env,
  )
}

locals {
  fqdn           = var.subdomain == null ? var.domain_name : "${var.subdomain}.${var.domain_name}"
  url            = "https://${local.fqdn}"
}

module "wandb_app" {
  source  = "wandb/wandb/kubernetes"
  version = "1.14.1"

  license        = var.license
  wandb_replicas = 1
  host           = local.url
  
  bucket                     = module.storage.bucket_connection_string
  bucket_queue               = "internal://"
  database_connection_string = module.database.connection_string
  #redis_connection_string    = module.redis.connection_string

  other_wandb_env = merge({
     # Fake value. no meaning. But required.
    "AWS_REGION" = "var-must-be-set-despite-not-needed"
  }, var.other_wandb_env)
}

