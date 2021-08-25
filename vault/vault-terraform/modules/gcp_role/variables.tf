variable "gcp_auth_path" {
  type        = string
  description = "Path to the GCP Auth method"
  default     = ""
}

variable "role_name" {
  type        = string
  description = "Name of the GCP role"
  default     = ""
}

variable "type" {
  type        = string
  description = "Type of GCP authentication role (either gce or iam)"
  default     = ""
}

variable "bound_projects" {
  type        = list(string)
  description = "(Optional) An array of GCP project IDs. Only entities belonging to this project can authenticate under the role."
  default     = null #Defaults to any ProjectID
}

variable "bound_service_accounts" {
  type        = list(string)
  description = "GCP Service Accounts allowed to issue tokens under this role. (Note: Required if role type is iam)"
  default     = ["*"] #Defaults to any ProjectID
}

variable "token_ttl" {
  type        = number
  description = "The incremental lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
  default     = 86400 #24 hours
}

variable "token_max_ttl" {
  type        = number
  description = "The maximum lifetime for generated tokens in number of seconds. This current value of this will be referenced at renewal time."
  default     = 432000 #5 days
}

variable "token_bound_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks; if set, specifies blocks of IP addresses which can authenticate successfully, and ties the resulting token to these blocks as well."
  default     = null
}

variable "token_policies" {
  type        = list(string)
  description = "List of policies to encode onto generated tokens."
  default     = []
}
