output "sos_bucket_urn" {
  value       = digitalocean_spaces_bucket.sos_bucket.urn
  description = "SOS bucket URN"
}

output "sos_bucket_bucket_domain_name" {
  value       = digitalocean_spaces_bucket.sos_bucket.bucket_domain_name
  description = "SOS bucket bucket domain name"
}

output "sos_bucket_endpoint" {
  value       = digitalocean_spaces_bucket.sos_bucket.endpoint
  description = "SOS bucket endpoint"
}

output "sos_cdn_origin" {
  value       = digitalocean_cdn.sos_cdn.origin
  description = "SOS CDN origin"
}

output "sos_cdn_endpoint" {
  value       = digitalocean_cdn.sos_cdn.endpoint
  description = "SOS CDN endpoint"
}
