resource "aws_s3_bucket" "site" {
  acl = "private"

  policy = "${data.aws_iam_policy_document.s3_policy.json}"

  tags = "${merge(
    var.default_tags,
    map("Role", "static site")
  )}"
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${var.origin_access_id}"]
    }
  }
}
