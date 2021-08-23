variable "gcp_project_id" {
  default     = ""
  description = "The name of the GCP project to work on."
}

variable "autogenerate_secert" {
  default     = true
  description = "Whether to use random dynamically secret generator."
}

variable "name" {
  description = "The name of the secret in GCP secret manager."
}

variable "chars_count" {
  description = "The number of chars to include in the generate secert."
  default     = 64
}

variable "use_special_chars" {
  description = "Specify if you include special chars in the secret."
  default     = false
}

variable "secret_value" {
  description = "The secret value to include in the secret. Conflicts with varible autogenerate. If autogenerate is false, this value must be specified."
}
