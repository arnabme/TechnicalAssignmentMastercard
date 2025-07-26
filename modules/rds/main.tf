resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.env}-rds-subnet-group"
    Environment = var.env
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "Allow RDS traffic from allowed sources"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-rds-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.env}-rds"
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = var.multi_az
  storage_encrypted       = true
  backup_retention_period = 7
  deletion_protection     = false

  tags = {
    Name        = "${var.env}-rds"
    Environment = var.env
  }
}
