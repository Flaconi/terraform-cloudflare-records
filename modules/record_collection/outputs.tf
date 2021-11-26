output "values" {
  description = "Cloudflare Zone DNS Records"
  value       = { for v in cloudflare_record.this : v.value => { id = v.id, created = v.created_on } }
}
