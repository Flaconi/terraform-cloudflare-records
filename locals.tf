locals {
  zone_id = lookup(data.cloudflare_zones.this.result[0], "id")

  # We will index each record type on its unique properties.
  # Unique meaning that this index cannot exist twice,
  # therefore all other values that would not create duplicates are not used
  # as part of the index.
  # This will allow for adding new entries anywhere within the input list without changes
  # made to existing records.

  # Cloudflare record types:
  # https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record

  # CAA (type, name, data.tag and data.value)
  records_caa = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.data.tag}_${r.data.value}") => r
    if r.type == "CAA"
  }
  # A (type, name, value)
  records_a = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.content}") => r
    if r.type == "A"
  }
  # CNAME (type, name, value)
  records_cname = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.content}") => r
    if r.type == "CNAME"
  }
  # MX (type, name, value)
  records_mx = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.content}") => r
    if r.type == "MX"
  }
  # TXT (type, name, value)
  records_txt = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.content}") => r
    if r.type == "TXT"
  }
  # NS (type, name, value)
  records_ns = {
    for r in var.records : md5("${r.type}_${r.subdomain}_${r.content}") => r
    if r.type == "NS"
  }

  # Build record structure
  records = merge(
    local.records_caa,
    local.records_a,
    local.records_cname,
    local.records_mx,
    local.records_txt,
    local.records_ns,
  )
}
