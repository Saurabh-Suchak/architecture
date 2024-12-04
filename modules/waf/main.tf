resource "aws_wafv2_web_acl" "app_waf" {
  name  = "${var.project_name}-waf"
  scope = "REGIONAL" 

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project_name}-web-acl"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "SQLInjectionRule"
    priority = 1

    action {
      block {}
    }

    statement {
      sqli_match_statement {
        field_to_match {
          body {}
        }

        text_transformation {
          priority = 0
          type     = "NONE"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "SQLInjectionRule"
      sampled_requests_enabled   = true
    }
  }

  tags = {
    Environment = var.environment
  }
}

output "web_acl_arn" {

  value       = aws_wafv2_web_acl.app_waf.arn
}

output "web_acl_name" {

  value       = aws_wafv2_web_acl.app_waf.name
}


