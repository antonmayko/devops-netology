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

variable "serviceaccount_id" {
  type        = string
  description = "id"
}

variable "vpc_name" {
  type        = string
  default     = "netologyvpc"
  description = "VPC network name"
}

variable "subnet_name" {
  type        = string
  default     = "public"
  description = "VPC subnet name"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "subnet_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vm_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2204-lts"
}

variable "vm_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v3"
}

variable "boot_disk_size" {
  type        = number
  description = "boot disk size"
  default = "10"
}

variable "hard_disk_type" {
  type        = string
  description = "vm_hard_disk_type"
  default     = "network-hdd"
}

variable "vm_scale" {
  type        = number
  description = "количество_ВМ_в_группе"
  default = "3"
}



variable "resources" {
  type    = map(map(number))
  default = {
    public = {
      cores         = 2,
      memory        = 2,
      core_fraction = 20
    }
    private = {
      cores         = 2,
      memory        = 2,
      core_fraction = 20
    }
  }
}

