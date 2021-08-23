variable "project_id" {
  type        = string
  description = "The GCP project identifier where the secret will be created."
}

variable "id" {
  type        = string
  description = "The secret identifier to create; this value must be unique within the project."
}

variable "replication_locations" {
  type        = list(string)
  default     = []
  description = "An optional list of replication locations for the secret. If the value is an empty list (default) then an automatic replication policy will be applied."
}

variable "secret" {
  type        = string
  description = "The secret payload to store in Secret Manager. Binary values should be base64 encoded before use."
}

variable "accessors" {
  type        = list(string)
  default     = []
  description = "An optional list of IAM account identifiers that will be granted accessor (read-only) permission to the secret."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "An optional map of label key:value pairs to assign to the secret resources. Default is an empty map."
}
