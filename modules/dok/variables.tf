variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

# ---K8SCLUSTER-----------------------------------------------------------------
variable "dok_cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
}

variable "dok_cluster_region" {
  type        = string
  description = "Region of the Kubernetes cluster"
}

variable "dok_cluster_version" {
  type        = string
  description = "Version of the Kubernetes cluster"
  default     = "1.22.8-do.1"
}

variable "dok_cluster_vpc_uuid" {
  type        = string
  description = "VPC UUID for the Kubernetes cluster"
}

variable "dok_cluster_auto_upgrade" {
  type        = bool
  description = "Enable auto-upgrade for the Kubernetes cluster"
  default     = true
}

variable "dok_cluster_ha" {
  type        = bool
  description = "Enable high availability for the Kubernetes cluster"

}

variable "dok_cluster_default_node_pool_name" {
  type        = string
  description = "Name of the default node pool"
}

variable "dok_cluster_default_node_pool_size" {
  type        = string
  description = "Size of the default node pool"
  default     = "s-1vcpu-2gb"
}

variable "dok_cluster_default_node_pool_node_count" {
  type        = number
  description = "Number of nodes for the default node pool"
  default     = 1
}

variable "dok_cluster_default_node_pool_auto_scale" {
  type        = bool
  description = "Enable auto-scaling for the default node pool"
  default     = false
}

variable "dok_cluster_default_node_pool_min_nodes" {
  type        = number
  description = "Minimum number of nodes for the default node pool"
  default     = 1
}

variable "dok_cluster_default_node_pool_max_nodes" {
  type        = number
  description = "Maximum number of nodes for the default node pool"
  default     = 3
}

variable "dok_cluster_destroy_all_associated_resources" {
  type        = bool
  description = <<EOF
  When set to true, all associated DigitalOcean resources created via the 
  Kubernetes API (load balancers, volumes, and volume snapshots) will be 
  destroyed along with the cluster when it is destroyed.
  EOF
  default     = true
}
