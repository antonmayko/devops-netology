### Cloud vars
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

### VPC vars
variable "vpc_name" {
  type        = string
  default     = "network"
  description = "VPC network name"
}
variable "subnet_name" {
  type        = string
  default     = "subnet"
  description = "subnet name"
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

### VMS vars
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
variable "node_wms_count" {
  type        = number
  description = "VM node count"
  default = "4"
}
variable "cpu_cores_count" {
  type        = number
  description = "CPU cores count"
  default     = "2"
}
variable "ram_size" {
  type        = number
  description = "VM RAM size"
  default     = "2"
}
variable "cpu_core_fract" {
  type        = number
  description = "CPU core fraction"
  default     = "5"
}
variable "hard_disk_type" {
  type        = string
  description = "vm_hard_disk_type"
  default     = "network-hdd"
}
variable "boot_disk_size" {
  type        = number
  description = "boot disk size"
  default = "10"
}
