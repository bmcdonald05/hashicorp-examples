# For this method, a Vault Token is reguired for Terraform to authenticate.
# You can set the VAULT_TOKEN via the VAULT_TOKEN environment variable. "export VAULT_TOKEN=token_goes_here"
# If none is otherwise supplied, Terraform will attempt to read it from ~/.vault-token (where the vault command stores its current token).
# Terraform will issue itself a new token that is a child of the one given, with a short TTL to limit the exposure of any requested secrets.
# Note that the given token must have the update capability on the auth/token/create path in Vault in order to create child tokens.

### Currently TF outputs a warning that modules do not have a required_providers block, but this can be ignored.

terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 2.21.0"
    }
  }
}

provider "vault" {
  address         = var.vault_cluster_addr
  skip_tls_verify = true #if TLS has not been setup
  # namespace       = "Sandbox" #If using a namespace
}


#Vault Audit Methods
# resource "vault_audit" "vault_syslog_audit" {
#   type = "syslog"
#   options = {
#     tag = "vault"
#     facility = "AUTH"
#   }
# }

# resource "vault_audit" "vault_file_audit" {
#   type = "file"
#   options = {
#     file_path = "opt/vault/audit.txt"
#   }
# }
