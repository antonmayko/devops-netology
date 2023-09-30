# First VM
variable "vm_web_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2004-lts"
}

variable "vm_web_res_name" {
  type        = string
  description = "resource name"
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v2"
}

# Second VM
variable "vm_db_image_family" {
  type        = string
  description = "VM image family"
  default = "ubuntu-2004-lts"
}

variable "vm_db_res_name" {
  type        = string
  description = "resource name"
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  description = "Platform ID"
  default = "standard-v2"
}

#######
variable "vms_resources" {
  type    = map(map(number))
  default = {
    web = {
      cores         = 2,
      memory        = 1,
      core_fraction = 5
    }
    db = {
      cores         = 2,
      memory        = 2,
      core_fraction = 20
    }
  }
}

# Metadata
variable "vms_metadata" {
  type = object(
    {serial-port-enable = number, ssh-keys = string}
    )
  default = {
    serial-port-enable = 1,
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZHv5FHBvLJU1dnuIq0lvXPOMKaIXhYPZm+93ofSewlecCx94KuWaxHQ37ZGaHASC43W8dL+BVB/iu4UJ+Em8WzKzmj2OtD4NzRdpGXM7a3ZoKeGwG8lvrLr3mNNOPiW3yDm5rVspNayhnmLgHxsSCqdclWz+h41GT2UD1/mymNvQNd7IYFEoQiRvsK301NRN7fH+YydlOf1D/n/N+pFf6TMJn3Nk0qKJbPuqUdZGMwi27su9aKxv0k1ihQoKoV7Hw2gmir3lfE/rXnxoXZgX9BiYZgQdCiLx2AuvKtlEWnlEQT3Mer5bYn+X1YqvSTBH5SJQo5pON/Zmlp/nUMBZDAZ7HMmFit4fEDFlfwvN6XWP3AGv8w2rov5x6LTnYp5Cl+sjTYjGdwvpw/s4xAIWl6nmaCn9CqvsdUa7ILMvCxWZhirvJLXsdcmzSceJ5e5fmaoYxsVr/vD694ZYz1IubBtt+Z0ezUdUCCxdPWRI070WcIqoEkTEIKlrWan6euAAHN5iAuUFLjbAUirwY99LKgASn3vXaOyDsQiPSS3nLW/ZCqakZjVAJnT+qO9JJlzNBvrrkp3ztpIlu17cPffYZWLfKdbyimgXKOUAuHFrLBqs4jhNgSs52qgYgSrdrFvfojBshfdfMglv2W6mTzElNK44765IICTRS6Rsq2F/GnQ== anton@desktop-2204"
  }
}