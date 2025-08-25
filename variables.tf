variable "domain" {
  description = "Cloudflare domain name to create"
  type        = string
}

variable "records" {
  description = "List of names to create"
  type = list(object({
    subdomain = optional(string, "") # Default is root domain
    content   = optional(string)
    type      = string
    ttl       = optional(number, 1)
    proxied   = optional(bool, false)
    priority  = optional(number)
    data = optional(object({
      flags = number
      tag   = string
      value = string
    }))
  }))
}
