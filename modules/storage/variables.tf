variable "namespace" {
  type        = string
  description = "Friendly name prefix used for tagging and naming resources."
}

variable "zone" {
  type        = string
  description = "Availability Zone."
}

variable "network" {
  description = "VPC subnet to which the cluster is connected."
#  type        = object({ id = string })
}
