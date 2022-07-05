#######################################
# S3 bucket
#######################################
resource "aws_s3_bucket" "base_bucket" {
  bucket = "base-bucket-oswlj"
}

resource "aws_s3_bucket_versioning" "base_s3_versioning" {
  bucket = aws_s3_bucket.base_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.base_bucket.id

  rule {
    id = "expiration"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "base_bucket_acl" {
  bucket = aws_s3_bucket.base_bucket.id
  acl    = "private"
}