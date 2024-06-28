terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.31.0"
    }
  }
}

provider "kubernetes" {
  host                   = var.dok_cluster_host
  token                  = var.dok_cluster_token
  cluster_ca_certificate = var.dok_cluster_ca_cert
}
