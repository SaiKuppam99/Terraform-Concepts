resource "aws_instance" "public-server" {
  count = var.environment == "Prod" ? 3 : 1
  #count                       = length(var.public_subnet_cidr)
  ami                         = lookup(var.amis, var.region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public_subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.vpc_name}-public-server-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
  user_data = <<-EOF
#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo apt install git -y
sudo git clone https://github.com/SaiKuppam99/web-page.git
sudo rm -rf /var/www/hmtl/index.nginx-debian.html
sudo cp webpage.index.html /var/www/html/index.html
echo "<h1>${var.vpc_name}-public-server-${count.index + 1}</h1>" >> /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
}