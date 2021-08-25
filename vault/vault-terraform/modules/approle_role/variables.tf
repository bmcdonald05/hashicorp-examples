variable "backend" {
  type        = string
  description = "Path of the Approle Auth mount"
  default     = "approle"
}

variable "role_name" {
  type        = string
  description = "Name of the Approle role"
  default     = ""
}

variable "policies" {
  type        = list(string)
  description = "A list of Vault policies to assign to the group"
  default     = [""]
}

variable "token_ttl" {
  type        = number
  description = "The incremental lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
  default     = 3600 # 1 Hour
}

variable "token_max_ttl" {
  type        = number
  description = "The maximum lifetime for generated tokens in seconds. This current value of this will be referenced at renewal time."
  default     = 3600 # 1 Hour
}

variable "token_bound_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks; if set, specifies blocks of IP addresses which can authenticate successfully, and ties the resulting token to these blocks as well."
  default     = null
}

variable "token_num_uses" {
  type        = number
  description = "The maximum number of times a generated token may be used (within its lifetime); 0 means unlimited. If you require the token to have the ability to create child tokens, you will need to set this value to 0."
  default     = 0
}

variable "secret_id_bound_cidrs" {
  type        = list(string)
  description = "Comma-separated string or list of CIDR blocks; if set, specifies blocks of IP addresses which can perform the login operation."
  default     = null
}

variable "secret_id_num_uses" {
  type        = number
  description = "Number of times any particular SecretID can be used to fetch a token from this AppRole, after which the SecretID will expire. A value of zero will allow unlimited uses."
  default     = 0
}

variable "secret_id_ttl" {
  type        = number
  description = "The number of seconds after which any SecretID expires."
  default     = 1800 #30m
}
