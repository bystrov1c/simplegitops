resource "kubernetes_manifest" "argocd_root" {
  manifest = yamldecode(
    templatefile("${path.module}/root.yaml", {
      git_path = var.git_path
      git_repoURL = var.git_repoURL
    })
  )  
}