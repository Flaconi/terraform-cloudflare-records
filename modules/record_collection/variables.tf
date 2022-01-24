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

variable "records" {
  description = "List of records to create"
  type = list(object({
    value    = optional(string)
    ttl      = optional(number)
    proxied  = optional(bool)
    priority = optional(number)
    data = optional(object({
      flags = number
      tag   = string
      value = string
    }))
  }))
  default = []
}

variable "allow_overwrite" {
  description = "Allow override existing records"
  type        = bool
  default     = false
}
