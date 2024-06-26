variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

# ---CLUSTER--------------------------------------------------------------------
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

variable "dbs_private_network_uuid" {
  type        = string
  description = "UUID of the private network"
}

# ---DATABASE-------------------------------------------------------------------
variable "dbs_db_name" {
  type        = string
  description = "Name of the database"
}

# ---FIREWALL-------------------------------------------------------------------
variable "dbs_firewall_rules" {
  type = list(object({
    type  = string
    value = string
  }))
  description = "List of firewall rules"
  default     = []
}

# ---USER-----------------------------------------------------------------------
variable "dbs_db_user_name" {
  type        = string
  description = "Name of the database user"
}
