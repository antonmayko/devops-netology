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

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZHv5FHBvLJU1dnuIq0lvXPOMKaIXhYPZm+93ofSewlecCx94KuWaxHQ37ZGaHASC43W8dL+BVB/iu4UJ+Em8WzKzmj2OtD4NzRdpGXM7a3ZoKeGwG8lvrLr3mNNOPiW3yDm5rVspNayhnmLgHxsSCqdclWz+h41GT2UD1/mymNvQNd7IYFEoQiRvsK301NRN7fH+YydlOf1D/n/N+pFf6TMJn3Nk0qKJbPuqUdZGMwi27su9aKxv0k1ihQoKoV7Hw2gmir3lfE/rXnxoXZgX9BiYZgQdCiLx2AuvKtlEWnlEQT3Mer5bYn+X1YqvSTBH5SJQo5pON/Zmlp/nUMBZDAZ7HMmFit4fEDFlfwvN6XWP3AGv8w2rov5x6LTnYp5Cl+sjTYjGdwvpw/s4xAIWl6nmaCn9CqvsdUa7ILMvCxWZhirvJLXsdcmzSceJ5e5fmaoYxsVr/vD694ZYz1IubBtt+Z0ezUdUCCxdPWRI070WcIqoEkTEIKlrWan6euAAHN5iAuUFLjbAUirwY99LKgASn3vXaOyDsQiPSS3nLW/ZCqakZjVAJnT+qO9JJlzNBvrrkp3ztpIlu17cPffYZWLfKdbyimgXKOUAuHFrLBqs4jhNgSs52qgYgSrdrFvfojBshfdfMglv2W6mTzElNK44765IICTRS6Rsq2F/GnQ== anton@desktop-2204"
}

variable "vm_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2004-lts"
}

variable "db_resources" {
  type    = list(object({ vm_name=string, cpu=number, ram=number, disk=number }))
  default = [ {vm_name="main", cpu  = 4, ram  = 4, disk = 8}, {vm_name="replica", cpu  = 2, ram  = 2, disk = 6 } ]
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