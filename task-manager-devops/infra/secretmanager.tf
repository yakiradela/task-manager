resource "aws_secretsmanager_secret" "db" {
  name = "db-credentials"
}

resource "aws_secretsmanager_secret_version" "db_version" {
  secret_id     = aws_secretsmanager_secret.db.id
  secret_string = jsonencode({
    POSTGRES_USER     = "postgres"
    POSTGRES_PASSWORD = "supersecure"
  })
}
