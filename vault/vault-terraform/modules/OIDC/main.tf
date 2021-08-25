resource "vault_jwt_auth_backend" "AAD_oidc" {
  description = "Azure AD OIDC Authentication"

  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
}

resource "vault_jwt_auth_backend_role" "default" {
  # lifecycle {
  #   ignore_changes = [
  #     allowed_redirect_uris,
  #   ]
  # }

  backend        = vault_jwt_auth_backend.AAD_oidc.path
  role_name      = "default"
  token_policies = ["default"]

  user_claim            = var.user_claim
  oidc_scopes           = ["https://graph.microsoft.com/.default", "profile", "email"]
  groups_claim          = "groups"
  allowed_redirect_uris = var.allowed_redirect_uris
  # verbose_oidc_logging  = true #Enable to troubleshoot issues
}

resource "vault_identity_group" "oidc_admin_group" {
  name     = "oidc-admins-group"
  type     = "external"
  policies = var.additional_policies
}

resource "vault_identity_group_alias" "admin_identity_group_alias" {
  name           = var.admin_aad_group_name
  mount_accessor = vault_jwt_auth_backend.AAD_oidc.accessor
  canonical_id   = vault_identity_group.oidc_admin_group.id
}
