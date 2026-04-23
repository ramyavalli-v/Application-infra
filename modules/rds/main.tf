resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnets"
  subnet_ids = var.subnets
}

resource "aws_db_instance" "this" {
  identifier             = var.name
  engine                 = "postgres"
  instance_class         = var.instance_class
  allocated_storage      = 20
  username               = "postgreuser"
  password               = "ChangeMe123!"
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true
  tags                   = var.tags
}