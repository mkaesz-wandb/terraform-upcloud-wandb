locals {
  db_ip             = upcloud_managed_database_mysql.wandb.service_host
  db_port           = upcloud_managed_database_mysql.wandb.service_port
  connection_string = "mysql://${local.master_username}:${local.master_password}@${local.db_ip}:${local.db_port}/${local.database_name}?ssl-mode=REQUIRED"
}

output "db_ip" {
  value       = upcloud_managed_database_mysql.wandb.service_host
  description = "The private IP address of the SQL database instance."
}

output "db_port" {
  value       = upcloud_managed_database_mysql.wandb.service_port
  description = "The private IP address of the SQL database instance."
}

output "database_name" {
  value = local.database_name
}

output "username" {
  value = local.master_username
}

output "password" {
  value = local.master_password
}

output "connection_string" {
  value = local.connection_string
}