variable "origin_access_id" {
  description = "CloudFront Origin Access Identity"
}

variable "domain_name" {
  description = "www.example.com"
}

variable "zone_id" {
  description = "Route53 zone ID in which the CNAME will be created to point to CF"
}

variable "default_tags" {
  type        = "map"
  description = "set of common tags for all resources"
}
