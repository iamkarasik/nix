{ pkgs, ... }:

{
  home.packages = with pkgs; [
    k9s
    kubectl
    kubectl-ktop
    kubectl-neat
    kubectl-tree
    kubernetes-helm
    kustomize
    skaffold
    stern

    kubelogin
    kubelogin-oidc
    kubernetes-helm
    aws-iam-authenticator
  ];
}

