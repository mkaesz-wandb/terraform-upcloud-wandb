variable "namespace" {
  type        = string
  description = "String used for prefix resources."
}

variable "zone" {
  type        = string
  description = "Availability Zone."
}

variable "license" {
  type        = string
  description = "Your wandb/local license"
}

variable "domain_name" {
  type        = string
  default     = null
  description = "Domain for accessing the Weights & Biases UI."
}

variable "subdomain" {
  type        = string
  default     = null
  description = "Subdomain for accessing the Weights & Biases UI. Default creates record at Route53 Route."
}

variable "other_wandb_env" {
  type        = map(any)
  description = "Extra environment variables for W&B"
  default     = {}
}

variable "deploy_nginx_ingress" {
  type        = string
  description = "deploy_nginx_ingress"
  default     = false
}