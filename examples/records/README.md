# Example

This example will create multiple DNS records.

Output for `example.com`:

```hcl
records = {
  "A_mytestdomain.example.com" = {
    "4.4.4.4" = {
      "created" = "2021-11-26T15:36:09.973899Z"
      "id" = "90bc69d4b5e5bb5c7a58858d7156cf36"
    }
    "8.8.8.8" = {
      "created" = "2021-11-26T15:36:09.764104Z"
      "id" = "03aae5145060e77dfc903e4a41ad7f4d"
    }
  }
  "CNAME_myproxieddomain.example.com" = {
    "example.com" = {
      "created" = "2021-11-26T15:36:10.544251Z"
      "id" = "20cfad416b4dcd3fdbb16d3d8e7ce2d3"
    }
  }
  "MX_mymaildomain.example.com" = {
    "mail1.mx.maildomainexample.com" = {
      "created" = "2021-11-26T15:36:10.323258Z"
      "id" = "61cc65ae9845eeb5d0a253f03cac2acd"
    }
    "mail2.mx.maildomainexample.com" = {
      "created" = "2021-11-26T15:36:10.189034Z"
      "id" = "e16fd484fa77f12049af5e8c66958626"
    }
  }
  "NS_mynsdomain.example.com" = {
    "ns1.mytestdns.com" = {
      "created" = "2021-11-26T15:36:11.447047Z"
      "id" = "b2ba6ade689541d5afff586bdacbfd5f"
    }
    "ns2.mytestdns.com" = {
      "created" = "2021-11-26T15:36:11.126715Z"
      "id" = "8df957fd25f7a2212fcae8ba00cd6b39"
    }
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.8 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_records"></a> [records](#module\_records) | ./../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | The Cloudflare API token. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Cloudflare domain name to create | `string` | `"example.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_records"></a> [records](#output\_records) | Cloudflare Zone DNS Records |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
