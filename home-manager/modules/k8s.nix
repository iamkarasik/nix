{pkgs, ...}: {
  home.packages = with pkgs; [
    k9s
    kind
    pkgs.iamkarasik.kubech
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

    # Other
    talosctl
    argo-workflows
    fluxcd
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
    source ${pkgs.iamkarasik.kubech}/share/kubech/kubech
    compdef k=kubectl
  '';
}
