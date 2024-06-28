resource "digitalocean_spaces_bucket" "sos_bucket" {
  name   = var.sos_bucket_name
  region = var.sos_bucket_region
  acl    = var.sos_bucket_acl
}

resource "digitalocean_cdn" "sos_bucket_cdn" {
  origin = digitalocean_spaces_bucket.sos_bucket.bucket_domain_name
}
