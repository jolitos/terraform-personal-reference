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
  description = ""
}

variable "tags" {
  type        = map(string)
  description = ""
  default     = {}
}

variable "key_prefix" {
  type    = string
  default = ""
}

variable "files" {
  type    = string
  default = ""
}


variable "website" {
  type        = map(string)
  default     = {}
  description = "map for website"
}
