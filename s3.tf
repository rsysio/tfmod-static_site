resource "aws_s3_bucket" "site" {
  acl = "private"

  tags = "${merge(
    var.default_tags,
    map("Role", "static site")
  )}"
}

data "aws_iam_policy_document" "bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${var.origin_access_id}"]
    }
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = "${aws_s3_bucket.site.id}"
  policy = "${data.aws_iam_policy_document.bucket.json}"
}
