locals {
  # Grouping records by type and name
  collections = { for r in var.records : "${r.type}_${r.name}.${var.domain}" => r... }
}

module "records" {
  source   = "./modules/record_collection"
  for_each = local.collections

  zone_id = data.cloudflare_zone.this.id
  name    = each.value[0].name
  type    = each.value[0].type
  values = [for r in each.value :
    {
      value    = r.value
      ttl      = r.ttl
      proxied  = r.proxied
      priority = r.priority
    }
  ]
  allow_overwrite = var.allow_overwrite
}
