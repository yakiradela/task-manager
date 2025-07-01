resource "aws_db_instance" "posgres" {
    allocated_storage       = 20
    engine                  = "postgres"
    instance_class          = "db.t3.micro"
    name                    = "tasks"
    username                = "postgres"
    password                = "secret"
    skip_final_snapshot     = true     
}
