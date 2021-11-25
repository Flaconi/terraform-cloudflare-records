output "zone_id" {
  description = "Cloudflare Zone ID"
  value       = data.cloudflare_zone.this.id
}

output "records" {
  description = "Cloudflare Zone DNS Records"
  value = {
  for k, v in local.records : k =>
    { id = cloudflare_record.this[k].id }
  }
}
