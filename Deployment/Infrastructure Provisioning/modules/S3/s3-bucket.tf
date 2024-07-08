resource "aws_s3_bucket" "main" {
  bucket = "ecommerce-bucket-${random_string.suffix.result}"
  acl    = "private"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

output "bucket_name" {
  value = aws_s3_bucket.main.id
}
