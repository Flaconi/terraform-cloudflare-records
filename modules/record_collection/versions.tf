terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.41"
    }
  }
  required_version = "~> 1.3"
}
