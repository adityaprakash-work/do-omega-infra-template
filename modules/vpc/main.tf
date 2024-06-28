resource "digitalocean_vpc" "vpc" {
  name        = var.vpc_name
  region      = var.vpc_region
  description = var.vpc_description
  ip_range    = var.vpc_ip_range
}

/* 
DO members (resources attached to the VPC persist for some time). `timeouts`
block don't seem to work for DOKS, the worker nodes take time to de-register
from the VPC. So, we need to wait for some time before destroying the VPC.
*/
resource "time_sleep" "vpc_destroy_wait" {
  depends_on       = [digitalocean_vpc.vpc]
  destroy_duration = var.vpc_destroy_wait_time
}
resource "null_resource" "vpc_destroy_wait_null" {
  depends_on = [time_sleep.vpc_destroy_wait]
}
