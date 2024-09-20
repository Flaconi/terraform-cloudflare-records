output "zone_id" {
  description = "Cloudflare Zone ID"
  value       = data.cloudflare_zone.this.id
}

output "records" {
  description = "Cloudflare Zone DNS Records"
  value = {
    for key, val in cloudflare_record.this : key =>
    {
      _record_id    = val.id,
      _ts_created   = val.created_on,
      _ts_modified  = val.modified_on,
      type          = val.type,
      name          = val.name,
      value_request = local.records[key].content != null ? local.records[key].content : "${local.records[key].data.data.flags} ${local.records[key].data.data.tag} \"${local.records[key].data.data.value}\"",
      value_applied = val.content,
      proxied       = val.proxied,
      ttl           = val.ttl,
    }
  }
}
