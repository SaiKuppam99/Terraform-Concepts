resource "null_resource" "Cluster" {
  count = var.environment == "Prod" ? 3 : 1
  provisioner "file" {

    source      = "user-data.sh"
    destination = "/tmp/user-data.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("LB.pem")
      host        = element(aws_instance.public-server.*.public_ip, count.index)

    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/user-data.sh",
      "sudo /tmp/user-data.sh",
      "sudo apt update -y",
      "sudo apt install jq  unzip -y"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("LB.pem")
      host        = element(aws_instance.public-server.*.public_ip, count.index)
    }
  }
}
