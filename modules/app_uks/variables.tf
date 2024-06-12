variable "namespace" {
  type        = string
  description = "The name prefix for all resources created."
}

variable "network" {
  description = "VPC subnet to which the cluster is connected."
}

variable "zone" {
  type        = string
  description = "Availability Zone."
}

variable "deploy_nginx_ingress" {
  type        = string
  description = "deploy_nginx_ingress"
}