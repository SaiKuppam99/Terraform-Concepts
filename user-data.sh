#!/bin/bash
# Update and install required packages
sudo apt update
sudo apt install -y nginx git

# Clone the repository
sudo git clone https://github.com/SaiKuppam99/web-page.git /tmp/web-page

# Replace the default nginx index file with the one from the repository
sudo rm -f /var/www/html/index.nginx-debian.html
sudo cp /tmp/web-page/index.html /var/www/html/index.html

# Add custom content without overwriting the original design
sudo sed -i '1i <h1>${vpc_name}-public-server-${count.index + 1}</h1>' /var/www/html/index.html
sudo sed -i '2i <h1>This means the upgrade worked well</h1>' /var/www/html/index.html

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

