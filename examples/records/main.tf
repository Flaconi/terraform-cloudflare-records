locals {
  records = [
    {
      name = "somedomain"
      type = "CAA"
      ttl  = 120
      data = {
        flags = 0
        tag   = "issue"
        value = "someca.com"
      }
    },
    {
      name = "somedomain"
      type = "CAA"
      ttl  = 120
      data = {
        flags = 0
        tag   = "issue"
        value = "anotherca.com"
      }
    },
    {
      name     = "myproxieddomain"
      content  = "example.com"
      type     = "CNAME"
      ttl      = 1
      proxied  = true
      priority = null
    },
    {
      name     = "mytestdomain"
      content  = "8.8.8.8"
      type     = "A"
      ttl      = 600
      proxied  = false
      priority = null
    },
    {
      name     = "mytestdomain"
      content  = "4.4.4.4"
      type     = "A"
      ttl      = 600
      proxied  = false
      priority = null
    },
    {
      name     = "mymaildomain"
      content  = "mail1.mx.maildomainexample.com"
      type     = "MX"
      ttl      = 300
      proxied  = false
      priority = 10
    },
    {
      name     = "mymaildomain"
      content  = "mail2.mx.maildomainexample.com"
      type     = "MX"
      ttl      = 300
      proxied  = false
      priority = 20
    },
    {
      name     = "mynsdomain"
      content  = "ns1.mytestdns.com"
      type     = "NS"
      ttl      = 300
      proxied  = false
      priority = null
    },
    {
      name     = "mynsdomain"
      content  = "ns2.mytestdns.com"
      type     = "NS"
      ttl      = 300
      proxied  = false
      priority = null
    },
  ]
}

module "records" {
  source    = "./../../"
  api_token = var.api_token
  domain    = var.domain
  records   = local.records
}
