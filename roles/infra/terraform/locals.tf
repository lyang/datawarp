resource "local_file" "private_key" {
  content         = module.vps.private_key
  filename        = "${path.module}/generated/ssh/server.key"
  file_permission = "0600"
}

resource "local_file" "inventory" {
  content  = templatefile("${path.module}/templates/inventory.yml.tftpl", { host = module.vps.ip_address, user = module.vps.user })
  filename = "${path.module}/generated/inventory/inventory.yml"
}

