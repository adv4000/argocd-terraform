data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
}


resource "kubernetes_manifest" "argocd_root" {
  manifest = yamldecode(templatefile("${path.module}/root.yaml", {
    path           = var.git_source_path
    repoURL        = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  }))
}
