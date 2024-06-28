output "dok_cluster_urn" {
  value       = digitalocean_kubernetes_cluster.k8sc.urn
  description = "Kubernetes cluster URN"
}

output "dok_cluster_host" {
  value       = digitalocean_kubernetes_cluster.k8sc.endpoint
  description = "Kubernetes cluster host name"
}

output "dok_cluster_token" {
  value       = digitalocean_kubernetes_cluster.k8sc.kube_config.0.token
  description = "Kubernetes cluster token"
  sensitive   = true
}

output "dok_cluster_ca_cert" {
  value = base64decode(
    digitalocean_kubernetes_cluster.k8sc.kube_config.0.cluster_ca_certificate
  )
  description = "Kubernetes cluster CA certificate"
  sensitive   = true
}
