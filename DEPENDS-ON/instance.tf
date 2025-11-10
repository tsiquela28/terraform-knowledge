resource "aws_key_pair" "siquela-keypair" {
  key_name   = "aws-key-new"
  public_key = file("./files/aws-key.pub")
}

resource "aws_ebs_volume" "disk" {
  availability_zone = module.vpc.azs[0]
  size              = 30

  tags = {
    Name = "Disco"
  }
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

  depends_on = [aws_ebs_volume.disk]

}

resource "aws_volume_attachment" "disk_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.disk.id
  instance_id = aws_instance.instance.id

  depends_on = [aws_instance.instance]
}