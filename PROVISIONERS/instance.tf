resource "aws_key_pair" "siquela-keypair" {
  key_name   = "aws-key"
  public_key = file("./files/aws-key.pub")
}


resource "aws_instance" "instance" {
  ami                         = "ami-035efd31ab8835d8a"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.siquela-keypair.key_name
  subnet_id                   = data.terraform_remote_state.network.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.network.outputs.security_group_id]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./files/aws-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo Teste Thiago Ranieri Siquela > /home/ubuntu/siquela.txt",
      "echo subnet_id: ${data.terraform_remote_state.network.outputs.subnet_id} >> /tmp/network.info",
      "echo security_group_id: ${data.terraform_remote_state.network.outputs.security_group_id} >> /tmp/network.info"
    ]
  }

  provisioner "file" {
    source      = "./files/arquivo1.txt"
    destination = "/home/ubuntu/arquivo1.txt"
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/ami.details"
  }

  tags = {
    Name = "vm-terraform"
  }

}