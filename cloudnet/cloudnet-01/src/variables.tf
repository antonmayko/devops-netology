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

variable "vpc_name" {
  type        = string
  default     = "netologyvpc"
  description = "VPC network name"
}

variable "subnet_name1" {
  type        = string
  default     = "public"
  description = "VPC subnet name"
}

variable "subnet_name2" {
  type        = string
  default     = "private"
  description = "VPC subnet name"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "subnet_cidr1" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet_cidr2" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZHv5FHBvLJU1dnuIq0lvXPOMKaIXhYPZm+93ofSewlecCx94KuWaxHQ37ZGaHASC43W8dL+BVB/iu4UJ+Em8WzKzmj2OtD4NzRdpGXM7a3ZoKeGwG8lvrLr3mNNOPiW3yDm5rVspNayhnmLgHxsSCqdclWz+h41GT2UD1/mymNvQNd7IYFEoQiRvsK301NRN7fH+YydlOf1D/n/N+pFf6TMJn3Nk0qKJbPuqUdZGMwi27su9aKxv0k1ihQoKoV7Hw2gmir3lfE/rXnxoXZgX9BiYZgQdCiLx2AuvKtlEWnlEQT3Mer5bYn+X1YqvSTBH5SJQo5pON/Zmlp/nUMBZDAZ7HMmFit4fEDFlfwvN6XWP3AGv8w2rov5x6LTnYp5Cl+sjTYjGdwvpw/s4xAIWl6nmaCn9CqvsdUa7ILMvCxWZhirvJLXsdcmzSceJ5e5fmaoYxsVr/vD694ZYz1IubBtt+Z0ezUdUCCxdPWRI070WcIqoEkTEIKlrWan6euAAHN5iAuUFLjbAUirwY99LKgASn3vXaOyDsQiPSS3nLW/ZCqakZjVAJnT+qO9JJlzNBvrrkp3ztpIlu17cPffYZWLfKdbyimgXKOUAuHFrLBqs4jhNgSs52qgYgSrdrFvfojBshfdfMglv2W6mTzElNK44765IICTRS6Rsq2F/GnQ== anton@desktop-2204"
}

variable "vm_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2204-lts"
}

variable "vm_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v2"
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

variable "vms_res" {
  type    = map(map(number))
  default = {
    public = {
      cores         = 2,
      memory        = 2,
      core_fraction = 5
    }
    private = {
      cores         = 2,
      memory        = 2,
      core_fraction = 5
    }
  }
}

