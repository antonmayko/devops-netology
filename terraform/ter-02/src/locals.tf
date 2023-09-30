locals {
  vm_web_name = "${var.vm_web_res_name}-cpufrac-${var.vms_resources.web.core_fraction}-ram-${var.vms_resources.web.memory}gb"
  vm_db_name = "${var.vm_db_res_name}-cpufrac-${var.vms_resources.db.core_fraction}-ram-${var.vms_resources.db.memory}gb"
}