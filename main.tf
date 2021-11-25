locals {
  records = { for r in var.records: "${r.type}_${r.name}.${var.domain}" => r }
}

resource "cloudflare_record" "this" {
  for_each = local.records

  zone_id  = data.cloudflare_zone.this.id
  name     = "${each.value.name}.${var.domain}."
  value    = each.value.value
  type     = each.value.type
  ttl      = each.value.ttl
  proxied  = each.value.proxied

  allow_overwrite = var.allow_overwrite
}
