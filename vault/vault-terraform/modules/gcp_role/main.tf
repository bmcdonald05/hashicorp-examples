resource "vault_gcp_auth_backend_role" "gcp" {
  backend = var.gcp_auth_path
  role    = var.role_name
  type    = var.type

  bound_projects         = var.bound_projects
  bound_service_accounts = var.bound_service_accounts
  token_ttl              = var.token_ttl
  token_max_ttl          = var.token_max_ttl
  token_policies         = var.token_policies
  token_bound_cidrs      = var.token_bound_cidrs
}
