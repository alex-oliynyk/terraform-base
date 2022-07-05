#######################################
# S3 bucket
#######################################
resource "aws_s3_bucket" "sentrifugo_bucket" {
  bucket = "sentrifugo-bucket"
  acl    = "private"

  versioning {
        enabled = true
  }

  lifecycle_rule {
    id = "retention"
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }
}


#######################################
# S3 bucket object
#######################################
resource "aws_s3_bucket_object" "sentrifugo_object" {
  bucket = "sentrifugo-bucket"
  key    = "sentrifugo.zip"
  source = "../sentrifugo.zip"
  etag = filemd5("../sentrifugo.zip")
  depends_on  = [aws_s3_bucket.sentrifugo_bucket]
}