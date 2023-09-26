variable "eks_cluster_name" {
  description = "EKS Cluster name to deploy ArgoCD"
  type        = string
}

variable "chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
  default     = "5.46.0"
}
