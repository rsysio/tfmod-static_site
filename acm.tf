resource "aws_acm_certificate" "site" {
  domain_name       = "${var.domain_name}"
  validation_method = "EMAIL"

  tags = "${merge(
    var.default_tags,
    map("Role", "static site")
  )}"
}
