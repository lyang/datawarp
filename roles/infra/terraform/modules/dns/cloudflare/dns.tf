data "cloudflare_zone" "zone" {
  name = var.zone
}

resource "cloudflare_record" "server" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.subdomain
  value   = var.ip_address
  type    = "A"
}

resource "cloudflare_zone_dnssec" "dnssec" {
  zone_id = data.cloudflare_zone.zone.id
}

