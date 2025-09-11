moved {
    from = aws_s3_bucket.bucket_1
    to   = aws_s3_bucket.bucket_moved
}

removed {
  from = aws_s3_bucket.bucket3

  lifecycle {
    destroy = false
  }
}

import {
  to = aws_s3_bucket.bucket_3
  id = "moved-terraform-3"
}