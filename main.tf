locals {
  # We will index each record type on its unique properties.
  # Unique meaning that this index cannot exist twice,
  # therefore all other values that would not create duplicates are not used
  # as part of the index.
  # This will allow for adding new entries anywhere within the input list without changes
  # made to existing records.

  # Cloudflare record types:
  # https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record#type

  # CAA (type, name, data.tag and data.value)
  records_caa = {
    for r in var.records : md5("${r.type}_${r.name}_${r.data.tag}_${r.data.value}") => r
    if r.type == "CAA"
  }
  # A (type, name, value)
  records_a = {
    for r in var.records : md5("${r.type}_${r.name}_${r.value}") => r
    if r.type == "A"
  }
  # CNAME (type, name, value)
  records_cname = {
    for r in var.records : md5("${r.type}_${r.name}_${r.value}") => r
    if r.type == "CNAME"
  }
  # MX (type, name, value)
  records_mx = {
    for r in var.records : md5("${r.type}_${r.name}_${r.value}") => r
    if r.type == "MX"
  }
  # TXT (type, name, value)
  records_txt = {
    for r in var.records : md5("${r.type}_${r.name}_${r.value}") => r
    if r.type == "TXT"
  }
  # NS (type, name, value)
  records_ns = {
    for r in var.records : md5("${r.type}_${r.name}_${r.value}") => r
    if r.type == "NS"
  }

  # Build record structure
  records = {
    for key, val in merge(
      local.records_caa,
      local.records_a,
      local.records_cname,
      local.records_mx,
      local.records_txt,
      local.records_ns,
      ) : key => {
      name     = lookup(val, "name", null)
      type     = lookup(val, "type", null)
      content  = lookup(val, "value", null)
      ttl      = lookup(val, "ttl", null)
      proxied  = lookup(val, "proxied", null)
      priority = lookup(val, "priority", null)
      data     = lookup(val, "data", null) != null ? { data = val.data } : {}
    }
  }
}


resource "cloudflare_record" "this" {
  for_each = local.records

  zone_id  = data.cloudflare_zone.this.id
  type     = each.value.type
  name     = each.value.name
  content  = each.value.content
  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = each.value.priority

  dynamic "data" {
    for_each = each.value.data
    content {
      flags = data.value["flags"]
      tag   = data.value["tag"]
      value = data.value["value"]
    }
  }

  allow_overwrite = var.allow_overwrite
}
