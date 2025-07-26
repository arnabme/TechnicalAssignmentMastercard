output "efs_id" {
  description = "EFS File System ID"
  value       = aws_efs_file_system.this.id
}

output "efs_sg_id" {
  description = "EFS Security Group ID"
  value       = aws_security_group.efs_sg.id
}
