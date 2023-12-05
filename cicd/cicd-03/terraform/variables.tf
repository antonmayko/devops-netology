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
  default     = "develop"
  description = "VPC network&subnet name"
}


variable "vm_image_family" {
  type        = string
  description = "VM image family"
  default = "centos-7"
}

variable "vm_resources" {
  type    = list(object({ vm_name=string, cpu=number, ram=number, disk=number }))
  default = [ {vm_name="vm1", cpu  = 2, ram  = 4, disk = 10}, {vm_name="vm2", cpu  = 2, ram  = 4, disk = 10 }]
}

variable "vm_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v2"
}

variable "boot_disk_size" {
  type        = number
  description = "boot disk size"
  default = "5"
}

variable "hard_disk_type" {
  type        = string
  description = "vm_hard_disk_type"
  default     = "network-hdd"
}

variable "cpu_core_fract" {
  type        = number
  description = "CPU core fraction"
  default     = "5"
}

variable "vms_res" {
  type    = map(map(number))
  default = {
    web = {
      cores         = 2,
      memory        = 1,
      core_fraction = 5
    }
    storage = {
      cores         = 2,
      memory        = 2,
      core_fraction = 5
    }
  }
}

variable "web_wms_count" {
  type        = number
  description = "VM web count"
  default = "2"
}

variable "compute_disk_count" {
  type        = number
  description = "compute disk  count"
  default = "3"
}

variable "compute_disk_size" {
  type        = number
  description = "compute disk  size"
  default = "1"
}