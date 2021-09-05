variable "name" {
  type        = string
  description = "Bucket name"
}

variable "acl" {
  type        = string
  default     = "private"
  description = ""
}

variable "policy" {
  type        = string
  default     = null
  description = "description"
}

variable "tags" {
  type        = map(string)
  description = ""
  default     = {}
}