# The Vault provider alias withing modules does not appear to play nice with nested namespaces

# terraform {
#   required_providers {
#     vault = {
#       source = "hashicorp/vault"
#       version = ">= 2.21.0"
#       configuration_aliases = [ vault.namespace ]
#     }
#   }
# }

resource "vault_policy" "admins" {
  name   = "${var.namespace}-admins"
  policy = <<EOT
  #vault-admin.hcl

  # permit access to all sys backend configurations to administer Vault itself
  # note that some sys/ paths require sudo
  path "sys/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }

  # manage Vault auth methods
  path "auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }

  # manage Vault identities
  path "identity/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }

  # permit access to administer the OIDC auth method
  path "oidc/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }

  # permit access to administer the userpass auth method
  path "userpass/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }
EOT
}

resource "vault_policy" "secret_manager" {
  name = "${var.namespace}-secret-manager"

  policy = <<EOT
  # The Secret Manager policy gives broad access to a KV secrets engine enabled at the "secret" path.

  # List, create, update, and delete key/value secrets
  path "secret/*"
  {
    capabilities = ["create", "read", "update", "delete", "list"]
  }
EOT
}
