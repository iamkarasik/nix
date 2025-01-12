{ pkgs }:

with pkgs; [
  # AWS
  awscli2
  granted

  # Azure
  azure-cli

  # GCP
  (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])

  # k8s
  kubectl
  aws-iam-authenticator
  kubelogin
  kubelogin-oidc
  kubernetes-helm

  # HashiCorp-Vault
  vault
]
