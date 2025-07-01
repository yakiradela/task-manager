resource "aws_secretsmanager_secret" "db" {
    name = "task-api-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_version" {
    secret_id           = aws_secretsmanager_secret.db.id 
    secret_string       = jsondecode({
        POSTGRES_USER       = "postgres"
        POSTGRES_PASSWORD   = "supersecure"
    }) 
  
}
