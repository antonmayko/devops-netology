###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}
#
#variable "cloud_id" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
#}
#
#variable "folder_id" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
#}

#variable "default_zone" {
#  type        = string
#  default     = "ru-central1-a"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}

variable "subnet_id" {
  type        = string
  description = "subnet id"
}

variable "ssh-keys" {
  type        = string
  default     = ""
  description = "keys"
}

variable "image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2004-lts"
}

variable "disk_param" {
  type    = object({ type=string, size=number})
  default = { type = "network-hdd", size = 5 }
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

variable "name" {
  type        = string
  description = "VM name"
  default = "vm1"
}