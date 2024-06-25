output "dbs_cluster_host" {
  value       = digitalocean_database_cluster.dbc.host
  description = "Database cluster host"
}

output "dbs_private_cluster_host" {
  value       = digitalocean_database_cluster.dbc.private_host
  description = "Database cluster private host"
}

output "dbs_clsuter_port" {
  value       = digitalocean_database_cluster.dbc.port
  description = "Database cluster port"
}

output "dbs_default_db_uri" {
  value       = digitalocean_database_cluster.dbc.uri
  description = "Database URI"
}

output "dbs_private_default_db_uri" {
  value       = digitalocean_database_cluster.dbc.private_uri
  description = "Database private URI"
}

output "dbs_default_db_name" {
  value       = digitalocean_database_cluster.dbc.database
  description = "Database default name"
}

output "dbs_default_db_user_name" {
  value       = digitalocean_database_cluster.dbc.user
  description = "Database default user name"
}

output "dbs_default_db_user_password" {
  value       = digitalocean_database_cluster.dbc.password
  description = "Database default user password"
}

output "dbs_db_user_password" {
  value       = digitalocean_database_user.db_user.password
  description = "Database user password"
}
