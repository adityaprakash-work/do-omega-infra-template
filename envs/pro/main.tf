resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = "Production"
  #   resources = [
  #     module.vpc.vpc_urn
  #   ]
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
