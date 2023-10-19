terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
    config_path    = "~/.kube/config"
    config_context = "minikube"
}

resource "kubectl_manifest" "argocd_root" {
  yaml_body = templatefile("${path.module}/root.yaml", {
      git_path = var.git_path
      git_repoURL = var.git_repoURL
    }) 
}