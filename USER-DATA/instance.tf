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

  user_data = file("./files/getdocker.sh")

  tags = {
    Name = "vm-terraform"
  }

}