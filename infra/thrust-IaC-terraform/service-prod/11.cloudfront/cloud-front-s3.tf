resource "aws_cloudfront_distribution" "s3" {
    aliases                        = []
    enabled                        = true
    http_version                   = "http2"
    is_ipv6_enabled                = true
    price_class                    = "PriceClass_All"
    retain_on_delete               = false
    tags                           = {}
    tags_all                       = {}
    wait_for_deployment            = true

    default_cache_behavior {
        allowed_methods        = [
            "GET",
            "HEAD",
        ]
        cached_methods         = [
            "GET",
            "HEAD",
        ]
        forwarded_values {
          query_string = false

          cookies {
            forward = "none"
          }
        }
        compress               = true
        default_ttl            = 0
        max_ttl                = 0
        min_ttl                = 0
        smooth_streaming       = false
        target_origin_id       = "service-prod.s3.ap-southeast-1.amazonaws.com"
        trusted_key_groups     = []
        trusted_signers        = []
        viewer_protocol_policy = "redirect-to-https"
    }

    origin {
        connection_attempts = 3
        connection_timeout  = 10
        domain_name         = "service-prod.s3.ap-southeast-1.amazonaws.com"
        origin_id           = "service-prod.s3.ap-southeast-1.amazonaws.com"
    }

    restrictions {
        geo_restriction {
            locations        = []
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
        minimum_protocol_version       = "TLSv1"
    }
}
