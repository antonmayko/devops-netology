locals {
  ssh-key = "centos:${file("~/.ssh/id_rsa.pub")}"
}