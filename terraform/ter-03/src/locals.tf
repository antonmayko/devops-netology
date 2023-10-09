locals {
  ssh-key = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
}