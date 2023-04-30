variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
}

variable "object_lock_enabled" {
  description = "If the bucket should be locked to prevent objects from being deleted or overwritten."
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "If all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
  default     = false
}

variable "enable_static_website" {
  description = "If the bucket should be configured as a static website."
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "If the bucket should have versioning enabled."
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "If the bucket should have logging enabled."
  type        = bool
  default     = false
}

variable "enable_30d_lifecycle" {
  description = "If the bucket should have a 30 day lifecycle rule."
  type        = bool
  default     = false
}

variable "default_tags" {
  description = "Default tag values"
  type        = map(string)
  default = {
    Environment = "Dev"
  }
}