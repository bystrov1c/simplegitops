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

# resource "helm_release" "nginx_ingress" {
#   name = "nginx-ingress-controller"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart = "nginx-ingress-controller"

#   set {
#       name  = "controller.publishService.enabled"
#       value = "true"
#   }
# }