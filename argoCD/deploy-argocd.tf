module "argocd" {
    source = "./default"
    git_path = "argoCD/default/applications"
    git_repoURL = "git@github.com:bystrov1c/simplegitops.git"  
}