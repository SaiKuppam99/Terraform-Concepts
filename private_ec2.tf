resource "aws_instance" "private-server" {
  count = var.environment == "Prod" ? 3 : 1
  #count                  = length(var.private_subnet_cidr)
  ami                    = lookup(var.amis, var.region)
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(aws_subnet.private_subnets.*.id, count.index)
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  tags = {
    Name        = "${var.vpc_name}-private-server-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
