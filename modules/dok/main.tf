resource "digitalocean_kubernetes_cluster" "k8sc" {
  name                             = var.dok_cluster_name
  region                           = var.dok_cluster_region
  version                          = var.dok_cluster_version
  vpc_uuid                         = var.dok_cluster_vpc_uuid
  auto_upgrade                     = var.dok_cluster_auto_upgrade
  ha                               = var.dok_cluster_ha
  destroy_all_associated_resources = var.dok_cluster_destroy_all_associated_resources

  node_pool {
    name       = var.dok_cluster_default_node_pool_name
    size       = var.dok_cluster_default_node_pool_size
    node_count = var.dok_cluster_default_node_pool_node_count
    auto_scale = var.dok_cluster_default_node_pool_auto_scale
    min_nodes  = var.dok_cluster_default_node_pool_min_nodes
    max_nodes  = var.dok_cluster_default_node_pool_max_nodes
  }
}
