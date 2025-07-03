resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  db_name                 = "tasks"
  username                = "postgres"
  password                = "secret"
  skip_final_snapshot     = true
}
