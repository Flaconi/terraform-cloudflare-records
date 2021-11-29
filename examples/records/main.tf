locals {
  records = [
    {
      name     = "myproxieddomain"
      value    = "example.com"
      type     = "CNAME"
      ttl      = 1
      proxied  = true
      priority = null
    },
    {
      name     = "mytestdomain"
      value    = "8.8.8.8"
      type     = "A"
      ttl      = 600
      proxied  = false
      priority = null
    },
    {
      name     = "mytestdomain"
      value    = "4.4.4.4"
      type     = "A"
      ttl      = 600
      proxied  = false
      priority = null
    },
    {
      name     = "mymaildomain"
      value    = "mail1.mx.maildomainexample.com"
      type     = "MX"
      ttl      = 300
      proxied  = false
      priority = 10
    },
    {
      name     = "mymaildomain"
      value    = "mail2.mx.maildomainexample.com"
      type     = "MX"
      ttl      = 300
      proxied  = false
      priority = 20
    },
    {
      name     = "mynsdomain"
      value    = "ns1.mytestdns.com"
      type     = "NS"
      ttl      = 300
      proxied  = false
      priority = null
    },
    {
      name     = "mynsdomain"
      value    = "ns2.mytestdns.com"
      type     = "NS"
      ttl      = 300
      proxied  = false
      priority = null
    },
  ]
}

module "records" {
  source = "./../../"
  api_token = var.api_token
  domain    = var.domain
  records   = local.records
}
