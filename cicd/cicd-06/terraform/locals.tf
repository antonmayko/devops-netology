locals {
  ssh-key = "centos:${file("~/.ssh/id_rsa.pub")}"
}

#ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes -o StrictHostKeyChecking=no ubuntu@158.160.49.11
