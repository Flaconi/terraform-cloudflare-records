output "values" {
  description = "Cloudflare Zone DNS Records"
  value       = { for v in cloudflare_record.this : contains(keys(v), "value") ? v.value : v.data.value => { id = v.id, created = v.created_on } }
}
