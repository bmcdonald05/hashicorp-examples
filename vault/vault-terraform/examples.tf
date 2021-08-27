### OIDC ###
module "root_oidc" {
  source = "./modules/OIDC"

  oidc_discovery_url    = var.oidc_discovery_url
  oidc_client_id        = var.oidc_client_id
  oidc_client_secret    = var.oidc_client_secret
  allowed_redirect_uris = var.allowed_redirect_uris
  user_claim            = "name" #Should be one of name, email, or UPN
  additional_policies   = [vault_policy.admins.name]
  admin_aad_group_name  = var.admin_aad_group_name
}

resource "vault_mount" "root_kv_v2" {
  path        = "secret"
  type        = "kv-v2"
  description = "This is a standard mount for kv version 2"
}

resource "vault_policy" "admins" {
  name   = "vault-admins"
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
