resource "aws_key_pair" "siquela-keypair" {
  key_name   = "aws-key-new"
  public_key = file("./files/aws-key.pub")
}


resource "aws_instance" "instance" {
  ami                         = "ami-035efd31ab8835d8a"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.siquela-keypair.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.sgdefault.id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}