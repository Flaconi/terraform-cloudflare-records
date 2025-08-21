resource "cloudflare_dns_record" "this" {
  for_each = local.records

  # Required
  zone_id = local.zone_id
  type    = each.value.type
  name    = each.value.name
  ttl     = each.value.ttl

  # Optional
  content  = each.value.content
  proxied  = each.value.proxied
  priority = each.value.priority
  data     = each.value.data
}
