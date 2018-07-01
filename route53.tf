resource "aws_route53_record" "site" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = "300"

  alias {
    name                   = "${aws_cloudfront_distribution.site.domain_name}"
    zone_id                = "${var.zone_id}"
    evaluate_target_health = false
  }
}
