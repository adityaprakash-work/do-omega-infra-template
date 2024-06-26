resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = "Production"
  resources = [
    module.dbs.dbs_cluster_urn,
    module.kub.kub_cluster_urn,
  ]
}

/* NOTE
[1] DO seems to not auto-infer the provider config. from the root versions.tf
    so we need to explicitly pass do_token to the each module's versions.tf
[2] Default VPCs of a region cannot be deleted. This is a known limitation in 
    the DigitalOcean API. If a region is being used for the first time, the VPC 
    hence created cannot be deleted which will inturn fail `terraform destroy`.
*/
module "vpc" {
  source          = "../../modules/vpc"
  do_token        = var.do_token
  vpc_name        = var.vpc_name
  vpc_region      = var.vpc_region
  vpc_description = var.vpc_description
  vpc_ip_range    = var.vpc_ip_range
}

module "dbs" {
  source                   = "../../modules/dbs"
  do_token                 = var.do_token
  dbs_cluster_name         = var.dbs_cluster_name
  dbs_engine               = var.dbs_engine
  dbs_size                 = var.dbs_size
  dbs_region               = var.dbs_region
  dbs_node_count           = var.dbs_node_count
  dbs_version              = var.dbs_version
  dbs_private_network_uuid = module.vpc.vpc_id
  dbs_db_name              = var.dbs_db_name
  dbs_firewall_rules       = var.dbs_firewall_rules
  dbs_db_user_name         = var.dbs_db_user_name
}

module "kub" {
  source                                   = "../../modules/kub"
  do_token                                 = var.do_token
  kub_cluster_name                         = var.kub_cluster_name
  kub_cluster_region                       = var.kub_cluster_region
  kub_cluster_version                      = var.kub_cluster_version
  kub_cluster_vpc_uuid                     = module.vpc.vpc_id
  kub_cluster_auto_upgrade                 = var.kub_cluster_auto_upgrade
  kub_cluster_ha                           = var.kub_cluster_ha
  kub_cluster_default_node_pool_name       = var.kub_cluster_default_node_pool_name
  kub_cluster_default_node_pool_size       = var.kub_cluster_default_node_pool_size
  kub_cluster_default_node_pool_node_count = var.kub_cluster_default_node_pool_node_count
  kub_cluster_default_node_pool_auto_scale = var.kub_cluster_default_node_pool_auto_scale
}
