locals {
  records = [
    # Root domain
    {
      subdomian = "" # Optional
      content   = "1.1.1.1"
      type      = "A"
      ttl       = 1
    },
    # Sub-domain CAA
    {
      subdomian = "somedomain"
      type      = "CAA"
      ttl       = 120
      data = {
        flags = 0
        tag   = "issue"
        value = "someca.com"
      }
    },
    {
      subdomian = "somedomain"
      type      = "CAA"
      ttl       = 120
      data = {
        flags = 0
        tag   = "issue"
        value = "anotherca.com"
      }
    },
    # Sub-domain CNAME
    {
      subdomian = "myproxieddomain"
      content   = "example.com"
      type      = "CNAME"
      ttl       = 1
      proxied   = true
    },
    # Sub-domain A-record
    {
      subdomian = "mytestdomain"
      content   = "8.8.8.8"
      type      = "A"
      ttl       = 600
      proxied   = false
    },
    {
      subdomian = "mytestdomain"
      content   = "4.4.4.4"
      type      = "A"
      ttl       = 600
      proxied   = false
    },
    # Root domain MX-record
    {
      subdomian = "" # Optional
      content   = "mx.example.com"
      type      = "MX"
      ttl       = 300
      proxied   = false
      priority  = 10
    },
    # Sub-domain MX-record
    {
      subdomian = "mymaildomain"
      content   = "mail1.mx.maildomainexample.com"
      type      = "MX"
      ttl       = 300
      proxied   = false
      priority  = 10
    },
    {
      subdomian = "mymaildomain"
      content   = "mail2.mx.maildomainexample.com"
      type      = "MX"
      ttl       = 300
      proxied   = false
      priority  = 20
    },
    # Sub-domain NS-record
    {
      subdomian = "mynsdomain"
      content   = "ns1.mytestdns.com"
      type      = "NS"
      ttl       = 300
      proxied   = false
    },
    {
      subdomian = "mynsdomain"
      content   = "ns2.mytestdns.com"
      type      = "NS"
      ttl       = 300
      proxied   = false
    },
  ]
}

provider "cloudflare" {
  api_token = var.api_token
}

module "records" {
  source  = "./../../"
  domain  = var.domain
  records = local.records
}
