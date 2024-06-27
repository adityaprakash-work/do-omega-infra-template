variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

variable "spaces_access_id" {
  type        = string
  description = "Access ID for accessing the Spaces bucket"
}

variable "spaces_secret_key" {
  type        = string
  description = "Secret key for accessing the Spaces bucket"
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
