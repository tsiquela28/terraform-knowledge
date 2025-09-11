resource "aws_s3_bucket" "bucket_moved" {
    bucket = "moved-terraform-1"
}

resource "aws_s3_bucket" "bucket_2" {
    bucket = "moved-terraform-2"
}

resource "aws_s3_bucket" "bucket_3" {
    bucket = "moved-terraform-3"
}