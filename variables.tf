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
    value    = string
    type     = string
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
