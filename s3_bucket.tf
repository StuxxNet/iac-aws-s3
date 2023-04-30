resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  object_lock_enabled = var.object_lock_enabled

  force_destroy = var.force_destroy

  tags = var.default_tags
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count = var.enable_versioning ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_website_configuration" "statis_website" {
  count = var.enable_static_website ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "nonversioned_30d_lifecycle" {
  count = var.enable_30d_lifecycle && var.enable_versioning == false ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "30d-lifecycle"

    expiration {
      days = 90
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

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
