variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
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
