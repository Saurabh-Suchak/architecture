resource "aws_secretsmanager_secret" "app_secret" {
  name        = "app-secrets"
  description = "Secrets for the application"
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = jsonencode({
    DB_PASSWORD = "1234"
    API_KEY     = "secure-api-key"
    SID         = ""
    KEY         = ""
  })
}

output "secrets_arn" {
  description = "The ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.app_secret.arn
}

output "secrets_name" {
  description = "The name of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.app_secret.name
}





