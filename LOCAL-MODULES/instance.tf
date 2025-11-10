resource "aws_key_pair" "siquela-keypair" {
  key_name   = "aws-key"
  public_key = file("./files/aws-key.pub")
}


resource "aws_instance" "instance" {
  ami                         = "ami-035efd31ab8835d8a"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.siquela-keypair.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname ${var.enviroment}
              EOF 


  tags = {
    Name = "vm-terraform"
  }

}