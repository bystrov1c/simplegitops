provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "minikube"
  }
}

resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  namespace = "argocd"
  version = "5.46.8"
  create_namespace = true
  values = [file("${path.module}/values.yaml")]
}