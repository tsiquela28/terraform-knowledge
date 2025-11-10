resource "aws_s3_bucket" "bucket" {
  bucket = "lifecycle-thiago-terraform-new"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }

  tags = {
    test = "Siquela"
  }
}