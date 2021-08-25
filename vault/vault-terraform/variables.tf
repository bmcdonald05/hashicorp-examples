variable "vault_cluster_addr" {
  default = ""
}

variable "oidc_discovery_url" {
  type        = string
  description = "The OIDC Discovery URL, without any .well-known component (base path)."
  default     = ""
}

variable "oidc_client_secret" {
  type        = string
  description = "Client Secret used for OIDC backends."
  default     = ""
}

variable "oidc_client_id" {
  type        = string
  description = "Client ID used for OIDC backends."
  default     = ""
}

variable "allowed_redirect_uris" {
  type        = list(any)
  description = "List of strings of allowed redirect URIs. Should be the two redirect URIs for Vault CLI and UI access."

}

variable "admin_aad_group_name" {
  type        = string
  description = "The Object ID of the Azure AD group to setup external group aliasing for admin users"
  default     = ""
}

variable "default_user_aad_group_name" {
  type        = string
  description = "The Object ID of the Azure AD group to setup external group aliasing for default users"
  default     = ""
}
