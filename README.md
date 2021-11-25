# terraform-cloudflare-records

Terraform module to create set of DNS records in Cloudflare Hosted Zone.

[![lint](https://github.com/flaconi/terraform-cloudflare-records/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-cloudflare-records/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-cloudflare-records/workflows/test/badge.svg)](https://github.com/flaconi/terraform-cloudflare-records/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-cloudflare-records.svg)](https://github.com/flaconi/terraform-cloudflare-records/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.2 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.2 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_api_token"></a> [api\_token](#input\_api\_token)

Description: The Cloudflare API token.

Type: `string`

### <a name="input_domain"></a> [domain](#input\_domain)

Description: Cloudflare domain name to create

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_records"></a> [records](#input\_records)

Description: Cloudflare domain name to create

Type:

```hcl
list(object({
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
```

Default: `[]`

### <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite)

Description: Allow override existing records

Type: `bool`

Default: `false`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_records"></a> [records](#output\_records) | Cloudflare Zone DNS Records |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Cloudflare Zone ID |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
