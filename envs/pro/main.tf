resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = "Production"
  resources = [
    module.dbs.dbs_cluster_urn,
    module.dok.dok_cluster_urn,
    module.sos.sos_bucket_urn
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
  source                = "../../modules/vpc"
  do_token              = var.do_token
  vpc_name              = var.vpc_name
  vpc_region            = var.vpc_region
  vpc_description       = var.vpc_description
  vpc_ip_range          = var.vpc_ip_range
  vpc_destroy_wait_time = var.vpc_destroy_wait_time
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
  depends_on               = [module.vpc]
}

module "dok" {
  source                                   = "../../modules/dok"
  do_token                                 = var.do_token
  dok_cluster_name                         = var.dok_cluster_name
  dok_cluster_region                       = var.dok_cluster_region
  dok_cluster_version                      = var.dok_cluster_version
  dok_cluster_vpc_uuid                     = module.vpc.vpc_id
  dok_cluster_auto_upgrade                 = var.dok_cluster_auto_upgrade
  dok_cluster_ha                           = var.dok_cluster_ha
  dok_cluster_default_node_pool_name       = var.dok_cluster_default_node_pool_name
  dok_cluster_default_node_pool_size       = var.dok_cluster_default_node_pool_size
  dok_cluster_default_node_pool_node_count = var.dok_cluster_default_node_pool_node_count
  dok_cluster_default_node_pool_auto_scale = var.dok_cluster_default_node_pool_auto_scale
  depends_on                               = [module.vpc]
}

module "sos" {
  source            = "../../modules/sos"
  do_token          = var.do_token
  sos_bucket_name   = var.sos_bucket_name
  sos_bucket_region = var.sos_bucket_region
  sos_bucket_acl    = var.sos_bucket_acl
}
