locals {
  collections = { for r in var.records : "${r.type}_${r.name}.${var.domain}" => r... }
}

module "records" {
  source   = "./modules/record_collection"
  for_each = local.collections

  zone_id = data.cloudflare_zone.this.id
  name    = each.value[0].name
  type    = each.value[0].type

  records = [for r in each.value :
    {
      value    = lookup(r, "value", null)
      ttl      = lookup(r, "ttl", null)
      proxied  = lookup(r, "proxied", null)
      priority = lookup(r, "priority", null)
      data     = lookup(r, "data", null)
    }
  ]

  allow_overwrite = var.allow_overwrite
}
