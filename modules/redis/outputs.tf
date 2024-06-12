locals {
  db_ip             = upcloud_managed_database_redis.wandb.service_host
  db_port           = upcloud_managed_database_redis.wandb.service_port
  username          = upcloud_managed_database_redis.wandb.service_username
  password          = upcloud_managed_database_redis.wandb.service_password
}

output "db_ip" {
  value       = local.db_ip
}

output "db_port" {
  value       = local.db_port
}

output "username" {
  value = local.username
}

output "password" {
  value = local.password
}

output "connection_string" {
  value = upcloud_managed_database_redis.wandb.service_uri
}