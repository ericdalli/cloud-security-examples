resource "aws_s3_bucket" "secure_logs" {
  bucket = "example-secure-logs-bucket"

  tags = {
    Name        = "secure-logs"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_logs" {
  bucket = aws_s3_bucket.secure_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "secure_logs" {
  bucket = aws_s3_bucket.secure_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "secure_logs" {
  bucket = aws_s3_bucket.secure_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
