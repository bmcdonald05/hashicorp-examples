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

# permit access to administer the aws secret engine
path "aws/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# permit access to administer the userpass auth method
path "userpass/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
