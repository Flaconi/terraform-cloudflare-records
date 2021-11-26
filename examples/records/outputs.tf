output "records" {
  description = "Cloudflare Zone DNS Records"
  value       = module.records.records
}
