#######################################
# RDS
#######################################
resource "aws_db_instance" "base_db" {
  allocated_storage     = 10
  max_allocated_storage = 50
  engine                = "mariadb"
  engine_version        = "10.6.7"
  instance_class        = "db.t3.micro"
  username              = "user"
  password              = "pass123"
  parameter_group_name  = "base_db"
  skip_final_snapshot   = true
  vpc_security_group_ids = [ aws_db_security_group.base_db_security_group.id ]
}

resource "aws_db_security_group" "base_db_security_group" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/16"
  }
}

resource "aws_db_subnet_group" "base_db_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.base_private_subnet_1.id, aws_subnet.base_private_subnet_2.id]
}