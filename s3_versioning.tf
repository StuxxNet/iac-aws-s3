resource "aws_s3_bucket_versioning" "versioning_example" {
  count = var.enable_versioning ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_lifecycle_configuration" "versioned_30d_lifecycle" {
  count = var.enable_30d_lifecycle && var.enable_versioning ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "30d-lifecycle"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}
