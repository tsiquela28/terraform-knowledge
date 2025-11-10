resource "aws_key_pair" "siquela2-keypair" {
  key_name   = "aws-key2"
  public_key = file("./files/aws-key.pub")
}


resource "aws_instance" "instance" {
  ami                         = "ami-035efd31ab8835d8a"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.siquela2-keypair.key_name
  subnet_id                   = data.terraform_remote_state.network.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.network.outputs.security_group_id]
  associate_public_ip_address = true

    lifecycle {
      replace_triggered_by = [ aws_s3_bucket.bucket ]
    }


  tags = {
    Name = "vm-terraform"
  }
}