variable "bucket_name" {
  description = "Nom unique du bucket S3"
  type        = string
}

variable "versioning_enabled" {
  description = "Activer le versioning des objets"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags associés au bucket"
  type        = map(string)
  default     = {}
}