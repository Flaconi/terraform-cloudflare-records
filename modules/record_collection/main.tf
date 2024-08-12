locals {
  records = [for r in var.records : {
    content  = lookup(r, "value", null)
    ttl      = lookup(r, "ttl", null)
    proxied  = lookup(r, "proxied", null)
    priority = lookup(r, "priority", null)
    data     = lookup(r, "data", null) != null ? { data = r.data } : {}
  }]
}

resource "cloudflare_record" "this" {
  count = length(local.records)

  zone_id  = var.zone_id
  type     = var.type
  name     = var.name
  content  = local.records[count.index].content
  ttl      = local.records[count.index].ttl
  proxied  = local.records[count.index].proxied
  priority = local.records[count.index].priority

  dynamic "data" {
    for_each = local.records[count.index].data
    content {
      flags = data.value["flags"]
      tag   = data.value["tag"]
      value = data.value["value"]
    }
  }

  allow_overwrite = var.allow_overwrite
}
