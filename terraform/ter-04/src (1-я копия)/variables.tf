###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop-test1"
  description = "VPC network&subnet name"
}

###common vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "your_ssh_ed25519_key"
#  description = "ssh-keygen -t ed25519"
#}
#
####example vm_web var
#variable "vm_web_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "example vm_web_ prefix"
#}

###example vm_db var
#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "example vm_db_ prefix"
#}

variable "vm_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2004-lts"
}

variable "disk_param" {
  type    = list(object({type=string, size=number}))
  default = [ { type = "network-hdd", size = 5 } ]
}

variable "vm_res" {
  type = map(number)
  default = {
      cores         = 2,
      memory        = 2,
      core_fraction = 5
  }
}

variable "vm_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v2"
}

variable "vm_name" {
  type        = string
  description = "VM name"
  default = "test-vm1-from-module"
}