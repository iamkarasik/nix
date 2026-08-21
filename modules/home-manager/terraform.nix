{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform
    terraform-ls
    tflint
  ];

  home.shellAliases = {
    tf = "terraform";
    tfa = "terraform apply";
    tfc = "terraform console";
    tfd = "terraform destroy";
    tff = "terraform fmt";
    tfg = "terraform graph";
    tfim = "terraform import";
    tfin = "terraform init";
    tfo = "terraform output";
    tfp = "terraform plan";
    tfpr = "terraform providers";
    tfr = "terraform refresh";
    tfsh = "terraform show";
    tft = "terraform taint";
    tfut = "terraform untaint";
    tfv = "terraform validate";
    tfw = "terraform workspace";
    tfs = "terraform state";
    tffu = "terraform force-unlock";
    tfwst = "terraform workspace select";
    tfwsw = "terraform workspace show";
    tfssw = "terraform state show";
    tfwde = "terraform workspace delete";
    tfwls = "terraform workspace list";
    tfsls = "terraform state list";
    tfwnw = "terraform workspace new";
    tfsmv = "terraform state mv";
    tfspl = "terraform state pull";
    tfsph = "terraform state push";
    tfsrm = "terraform state rm";
    tfay = "terraform apply -auto-approve";
    tfdy = "terraform destroy -auto-approve";
    tfinu = "terraform init -upgrade";
    tfpde = "terraform plan --destroy";
  };
}
