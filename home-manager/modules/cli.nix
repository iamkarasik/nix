{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    argo-workflows
    awscli2
    azure-cli
    bat
    btop
    cloc
    curl
    fd
    fzf
    gh
    granted
    htop
    jq
    neofetch
    nmap
    ripgrep
    vault
    wget
    yq
  ];
}
