terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.27"
    }
  }
  required_version = "~> 1.3"
}
