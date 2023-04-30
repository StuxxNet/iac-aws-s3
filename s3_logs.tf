resource "aws_s3_bucket" "log_bucket" {
  count = var.enable_logging ? 1 : 0

  bucket = format("%s-logs", aws_s3_bucket.bucket.id)

  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "ownership_control" {
  count = var.enable_logging ? 1 : 0

  bucket = aws_s3_bucket.log_bucket[0].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  count = var.enable_logging ? 1 : 0

  bucket = aws_s3_bucket.log_bucket[0].id
  acl    = "log-delivery-write"

  depends_on = [
    aws_s3_bucket_ownership_controls.ownership_control
  ]
}

resource "aws_s3_bucket_logging" "example" {
  count = var.enable_logging ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.log_bucket[0].id
  target_prefix = "log/"
}

resource "aws_s3_bucket_lifecycle_configuration" "logs_30d_lifecycle" {
  count = var.enable_logging ? 1 : 0

  bucket = aws_s3_bucket.log_bucket[0].id

  rule {
    id = "log-cycle"

    expiration {
      days = 90
    }

    filter {
      prefix = "log/"
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}