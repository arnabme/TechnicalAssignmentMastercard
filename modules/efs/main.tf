resource "aws_efs_file_system" "this" {
  creation_token = "${var.env}-efs"
  encrypted      = true

  tags = {
    Name        = "${var.env}-efs"
    Environment = var.env
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "${var.env}-efs-sg"
  description = "Allow NFS access to EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
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
    Name = "${var.env}-efs-sg"
  }
}

resource "aws_efs_mount_target" "this" {
  count          = length(var.subnet_ids)
  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.subnet_ids[count.index]
  security_groups = [
    aws_security_group.efs_sg.id
  ]
}
