variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
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
