variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "Cloudflare domain name to create"
  type        = string
  default     = "example.com"
}
