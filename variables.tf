variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}

variable "domain" {
  description = "Cloudflare domain name to create"
  type        = string
}

variable "records" {
  description = "List of names to create"
  type = list(object({
    name     = string
    value    = optional(string)
    type     = string
    ttl      = number
    proxied  = optional(bool)
    priority = optional(number)
    data = optional(object({
      flags = number
      tag   = string
      value = string
    }))
  }))
}

variable "allow_overwrite" {
  description = "Allow override existing records"
  type        = bool
  default     = false
}
