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

variable "fqdn" {
  type        = string
  description = "FQDN"
}