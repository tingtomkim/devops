resource "aws_s3_bucket" "s3" {
  count  = length(var.name)
  bucket = element(var.name, count.index)
  acl    = "${var.acl}"
}
resource "aws_s3_bucket" "s3_atlas" {
  count  = length(var.name)
  bucket = element(var.name, count.index)
  acl    = "${var.acl}"
}

resource "aws_s3_bucket_object" "object" {
  count  = length(var.name)
  bucket = element(var.name, count.index)
  key    = element(var.key, count.index)
  depends_on = [aws_s3_bucket.s3]
}
