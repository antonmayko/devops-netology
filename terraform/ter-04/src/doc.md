## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | ./vm1 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_disk_param"></a> [disk\_param](#input\_disk\_param) | Type of disk and size of disk | `list(object({type=string, size=number}))` | <pre>[<br>  {<br>    "size": 5,<br>    "type": "network-hdd"<br>  }<br>]</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_vm_image_family"></a> [vm\_image\_family](#input\_vm\_image\_family) | VM image family | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM name | `string` | `"test-vm1-from-module"` | no |
| <a name="input_vm_platform_id"></a> [vm\_platform\_id](#input\_vm\_platform\_id) | Platform ID | `string` | `"standard-v2"` | no |
| <a name="input_vm_res"></a> [vm\_res](#input\_vm\_res) | n/a | `map(number)` | <pre>{<br>  "core_fraction": 5,<br>  "cores": 2,<br>  "memory": 2<br>}</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop-test1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_external_ip_address"></a> [vm\_external\_ip\_address](#output\_vm\_external\_ip\_address) | n/a |
