variable "zone_id" {
  description = "Cloudflare Hosted Zone ID"
  type        = string
}

variable "name" {
  description = "Cloudflare Hosted Zone Record Name"
  type        = string
}

variable "type" {
  description = "Cloudflare Hosted Zone Record Type"
  type        = string
}

variable "values" {
  description = "List of values to create"
  type = list(object({
    value    = string
    ttl      = number
    proxied  = bool
    priority = number
  }))
  default = []
}

variable "allow_overwrite" {
  description = "Allow override existing records"
  type        = bool
  default     = false
}
