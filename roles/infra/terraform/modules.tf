module "vps" {
  source = "./modules/vps"
}

module "dns" {
  source     = "./modules/dns"
  ip_address = module.vps.ip_address
}

