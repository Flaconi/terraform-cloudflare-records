resource "cloudflare_record" "this" {
  count = length(var.values)

  zone_id  = var.zone_id
  type     = var.type
  name     = var.name
  value    = var.values[count.index].value
  ttl      = var.values[count.index].ttl
  proxied  = var.values[count.index].proxied
  priority = var.values[count.index].priority

  allow_overwrite = var.allow_overwrite
}
