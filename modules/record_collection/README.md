# Submodule record_collection

Terraform submodule to create a list of Cloudflare DNS records grouped by type and name.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.39 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare Hosted Zone ID | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Cloudflare Hosted Zone Record Name | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Cloudflare Hosted Zone Record Type | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | List of records to create | <pre>list(object({<br>    value    = optional(string)<br>    ttl      = optional(number, 1)<br>    proxied  = optional(bool, false)<br>    priority = optional(number)<br>    data = optional(object({<br>      flags = number<br>      tag   = string<br>      value = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite) | Allow override existing records | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_values"></a> [values](#output\_values) | Cloudflare Zone DNS Records |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
