variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

variable "spaces_access_id" {
  type        = string
  description = "Access ID for accessing the Spaces bucket"
  sensitive   = true
}

variable "spaces_secret_key" {
  type        = string
  description = "Secret key for accessing the Spaces bucket"
  sensitive   = true
}

# ---PROJECT--------------------------------------------------------------------
variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "project_description" {
  type        = string
  description = "Description of the project"
  default     = ""
}

variable "project_purpose" {
  type        = string
  description = "Purpose of the project"
  default     = "Web Application"
}

# ---VPC------------------------------------------------------------------------
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_region" {
  type        = string
  description = "Region of the VPC"
}

variable "vpc_description" {
  type        = string
  description = "Description of the VPC"
  default     = ""
}

variable "vpc_ip_range" {
  type        = string
  description = "IP range of the VPC in CIDR notation"
}

variable "vpc_destroy_wait_time" {
  type        = string
  description = "Time to wait before destroying the VPC"
  default     = "120s"
}

# ---DBCLUSTER------------------------------------------------------------------
variable "dbs_cluster_name" {
  type        = string
  description = "Name of the database cluster"
}

variable "dbs_engine" {
  type        = string
  description = "Database engine"
}

variable "dbs_size" {
  type        = string
  description = "Database Droplet size associated with the cluster"
  default     = "db-s-1vcpu-1gb"
}

variable "dbs_region" {
  type        = string
  description = "Region of the database cluster"
}

variable "dbs_node_count" {
  type        = number
  description = "Number of nodes in the database cluster"
  default     = 1
}

variable "dbs_version" {
  type        = string
  description = "Version of the database engine"
}

# ---DBDATABASE-----------------------------------------------------------------
variable "dbs_db_name" {
  type        = string
  description = "Name of the database"
}

# ---DBFIREWALL-----------------------------------------------------------------
variable "dbs_firewall_rules" {
  type = list(object({
    type  = string
    value = string
  }))
  description = "List of firewall rules"
  default     = []
}

# ---DBUSER---------------------------------------------------------------------
variable "dbs_db_user_name" {
  type        = string
  description = "Name of the database user"
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

# ---SOSBUCKET------------------------------------------------------------------
variable "sos_bucket_name" {
  type        = string
  description = "Name of the SOS bucket"
}

variable "sos_bucket_region" {
  type        = string
  description = "Region of the SOS bucket"
}

variable "sos_bucket_acl" {
  type        = string
  description = "Access control list for the SOS bucket"
}
