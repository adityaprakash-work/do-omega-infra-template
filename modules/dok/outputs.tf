output "kub_cluster_urn" {
  value       = digitalocean_kubernetes_cluster.k8sc.urn
  description = "Kubernetes cluster URN"
}
