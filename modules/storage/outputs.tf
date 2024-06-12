locals {
  bucket_name = upcloud_object_storage.wandb.name
  bucket_zone = upcloud_object_storage.wandb.zone
  bucket_access_key = upcloud_object_storage.wandb.access_key
  bucket_secret_key = upcloud_object_storage.wandb.secret_key
  bucket_internal_url = "${var.namespace}.${var.zone}.upcloudobjects.com"
}

output "bucket_name" {
  value = local.bucket_name
}

output "bucket_zone" {
  value = local.bucket_zone
}

output "bucket_access_key" {
  value = local.bucket_access_key
}

output "bucket_secret_key" {
  value = local.bucket_secret_key
}

output "bucket_internal_url" {
  value = local.bucket_internal_url
}

output "bucket_connection_string" {
  value = "s3://${local.bucket_access_key}:${local.bucket_secret_key}@${local.bucket_internal_url}/${local.bucket_name}?tls=true"
}
