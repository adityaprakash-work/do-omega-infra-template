resource "digitalocean_database_cluster" "dbc" {
  name                 = var.dbs_cluster_name
  engine               = var.dbs_engine
  version              = var.dbs_version
  size                 = var.dbs_size
  region               = var.dbs_region
  node_count           = var.dbs_node_count
  private_network_uuid = var.dbs_private_network_uuid
  project_id           = var.dbs_project_id
}

resource "digitalocean_database_db" "db" {
  cluster_id = digitalocean_database_cluster.dbc.id
  name       = var.dbs_db_name
}

resource "digitalocean_database_firewall" "dbc_allow_ip" {
  cluster_id = digitalocean_database_cluster.dbc.id

  dynamic "rule" {
    for_each = var.dbs_firewall_rules
    content {
      type  = rule.value.type
      value = rule.value.value
    }
  }
}

resource "digitalocean_database_user" "db_user" {
  cluster_id = digitalocean_database_cluster.dbc.id
  name       = var.dbs_db_user_name
}
