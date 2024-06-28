variable "dok_cluster_host" {
  type        = string
  description = "Kubernetes cluster host name"
}

variable "dok_cluster_token" {
  type        = string
  description = "Kubernetes cluster token"
  sensitive   = true
}

variable "dok_cluster_ca_cert" {
  type        = string
  description = "Kubernetes cluster CA certificate"
  sensitive   = true
}
