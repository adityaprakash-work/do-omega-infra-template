variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
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
