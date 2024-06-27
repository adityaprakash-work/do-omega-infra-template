resource "digitalocean_kubernetes_cluster" "k8sc" {
  name                             = var.kub_cluster_name
  region                           = var.kub_cluster_region
  version                          = var.kub_cluster_version
  vpc_uuid                         = var.kub_cluster_vpc_uuid
  auto_upgrade                     = var.kub_cluster_auto_upgrade
  ha                               = var.kub_cluster_ha
  destroy_all_associated_resources = var.kub_cluster_destroy_all_associated_resources

  node_pool {
    name       = var.kub_cluster_default_node_pool_name
    size       = var.kub_cluster_default_node_pool_size
    node_count = var.kub_cluster_default_node_pool_node_count
    auto_scale = var.kub_cluster_default_node_pool_auto_scale
    min_nodes  = var.kub_cluster_default_node_pool_min_nodes
    max_nodes  = var.kub_cluster_default_node_pool_max_nodes
  }
}
