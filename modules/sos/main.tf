resource "digitalocean_spaces_bucket" "sos_bucket" {
  name   = var.sos_bucket_name
  region = var.sos_bucket_region
}
