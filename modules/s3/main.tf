resource "aws_s3_bucket" "video_assets" {
  bucket = "${var.project_name}-${var.environment}-assets"
  acl    = "private"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "video_assets_versioning" {
  bucket = aws_s3_bucket.video_assets.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.video_assets.bucket
}
