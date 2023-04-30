resource "aws_s3_bucket_website_configuration" "static_website" {
  count = var.enable_static_website ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_preference_website" {
  count = var.enable_static_website ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_allow_public_access" {
  count = var.enable_static_website ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy_website" {
  count = var.enable_static_website ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = [
            format("%s/index.html", aws_s3_bucket.bucket.arn),
            format("%s/error.html", aws_s3_bucket.bucket.arn)
        ]
      },
    ]
  })
}