terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.2"
    }
  }
  required_version = "~> 1.0"
}
