resource "aws_lightsail_key_pair" "key_pair" {
  name = "key_pair"
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = "static_ip"
}

resource "aws_lightsail_instance" "server" {
  name              = "server"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = aws_lightsail_key_pair.key_pair.id
}

resource "aws_lightsail_static_ip_attachment" "ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name  = aws_lightsail_instance.server.id
}

resource "aws_lightsail_instance_public_ports" "public_ports" {
  instance_name = aws_lightsail_instance.server.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
}

