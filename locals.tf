locals {
  tags = {
    deployedby  = "Terraform"
    provider    = "azr"
    create_date = formatdate("DD/MM/YY hh:mm", timeadd(timestamp(), "-3h"))
    type        = "paas"
    resource    = "kubernetes"
    layer       = "application"
  }
}