variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
  sensitive   = true
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
    ttl      = optional(number, 1)
    proxied  = optional(bool, false)
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
