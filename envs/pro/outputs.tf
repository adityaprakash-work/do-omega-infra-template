# ---DATABASES------------------------------------------------------------------
output "dbs_cluster_host" {
  value       = module.dbs.dbs_cluster_host
  description = "Database cluster host"
}

output "dbs_private_cluster_host" {
  value       = module.dbs.dbs_private_cluster_host
  description = "Database cluster private host"
}

output "dbs_clsuter_port" {
  value       = module.dbs.dbs_clsuter_port
  description = "Database cluster port"
}

output "dbs_default_db_uri" {
  value       = module.dbs.dbs_default_db_uri
  description = "Database URI"
  sensitive   = true
}

output "dbs_private_default_db_uri" {
  value       = module.dbs.dbs_private_default_db_uri
  description = "Database private URI"
  sensitive   = true
}

output "dbs_default_db_name" {
  value       = module.dbs.dbs_default_db_name
  description = "Database default name"
}

output "dbs_default_db_user_name" {
  value       = module.dbs.dbs_default_db_user_name
  description = "Database default user name"
}

output "dbs_default_db_user_password" {
  value       = module.dbs.dbs_default_db_user_password
  description = "Database default user password"
  sensitive   = true
}

output "dbs_db_user_password" {
  value       = module.dbs.dbs_db_user_password
  description = "Database user password"
  sensitive   = true
}
