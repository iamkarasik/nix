{pkgs, ...}: let
  kubech = pkgs.callPackage ../../pkgs/kubech {};
in {
  home.packages = with pkgs; [
    k9s
    kind
    kubech
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
    aws-iam-authenticator

    talosctl
  ];

  home.shellAliases = {
    k = "kubectl";
    kaa = "kubectl get all --all-namespaces";
    ka = "kubectl get pods --all-namespaces";
    kpods = "kubectl get pods";
    klogs = "kubectl logs";
    knodes = "kubectl get nodes";
    kserv = "kubectl get svc";
    ksvc = "kubectl get svc";
    kdep = "kubectl get deployments";
    kdeps = "kubectl get deployments";
    kedit = "kubectl edit";
    kdesc = "kubectl describe";
    kx = "kubectl exec -it";
    kpf = "kubectl port-forward";
    kdel = "kubectl delete";
    kctx = "kubectl config get-contexts $(kubectl config current-context)";
  };

  programs.zsh.initContent = ''
    source ${kubech}/share/kubech/kubech
    compdef k=kubectl
  '';
}
