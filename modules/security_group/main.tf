# resource "aws_security_group" "this" {
#   name        = var.name
#   description = var.description

#   ingress = [
#     for port in var.ingress_ports : {
#       description     = "Inbound rules"
#       from_port       = port
#       to_port         = port
#       protocol        = "tcp"
#       cidr_blocks     = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = []
#       security_groups = []
#       self            = false
#     }
#   ]

#   egress = [
#     {
#       description     = "Outbound rules"
#       from_port       = 0
#       to_port         = 0
#       protocol        = "-1"
#       cidr_blocks     = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = []
#       security_groups = []
#       self            = false
#     }
#   ]

#   tags = {
#     Name = var.name
#   }
# }
resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  # vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}
