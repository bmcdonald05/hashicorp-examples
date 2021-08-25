#Approle Role resource
resource "vault_approle_auth_backend_role" "role" {
  backend               = var.backend
  role_name             = var.role_name
  secret_id_num_uses    = var.secret_id_num_uses
  secret_id_bound_cidrs = var.secret_id_bound_cidrs
  secret_id_ttl         = var.secret_id_ttl
  token_policies        = var.policies
  token_num_uses        = var.token_num_uses
  token_bound_cidrs     = var.token_bound_cidrs
  token_ttl             = var.token_ttl
  token_max_ttl         = var.token_max_ttl
}

resource "vault_approle_auth_backend_role_secret_id" "id" {
  backend   = var.backend
  role_name = vault_approle_auth_backend_role.role.role_name
}

resource "vault_approle_auth_backend_login" "login" {
  backend   = var.backend
  role_id   = vault_approle_auth_backend_role.role.role_id
  secret_id = vault_approle_auth_backend_role_secret_id.id.secret_id
}

# Command:
# vault write auth/approle/role/<dev>/<appname> \
# policies="approle-<env>-<app-name>-<ro/rw/full>-policy"\
# secret_id_ttl=10m \
# token_num_uses=10 \
# token_ttl=20m \
# token_max_ttl=30m \
# secret_id_num_uses=40 \
# secret_id_bound_cidrs =<Comma separated ip whittelisting>
# token_bound_cidrs=<Comma separated ip whittelisting>
