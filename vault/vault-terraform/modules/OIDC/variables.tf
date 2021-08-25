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
  type        = list
  description = "List of strings of allowed redirect URIs. Should be the two redirect URIs for Vault CLI and UI access."

}

variable "user_claim" {
  type        = string
  description = "AAD user claim to use; likely name or email."
  default     = "email"
}

variable "namespace" {
  type        = string
  description = "Namespace to use for module and naming."
  default     = ""
}

variable "additional_policies" {
  type        = list
  description = "List of strings. Additional policies to add to external groups if desired."
  default     = []
}

variable "admin_aad_group_name" {
  type        = string
  description = "The Object ID of the Azure AD group to setup external group aliasing for Admins"
  default     = ""
}

variable "default_user_aad_group_name" {
  type        = string
  description = "The Object ID of the Azure AD group to setup external group aliasing for basic users"
  default     = ""
}
