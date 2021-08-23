# permit access to administer secrets KV secrets engine - admin cannot read secrets
path "secrets/*" {
  capabilities = ["create", "update", "delete"]
}

# permit access to list secrets KV v2 secrets engine
path "secrets/metadata/*" {
  capabilities = ["read", "list"]
}

# permit access to administer the AWS secrets engine
path "aws/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# permit access to administer the GCP secrets engine
path "gcp/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
