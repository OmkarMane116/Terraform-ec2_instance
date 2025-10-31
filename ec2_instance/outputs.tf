output "ec2_public_ip" { 
  description = "The public IP of the EC2 instance" 
  value       = aws_instance.ec2.public_ip 
} 
 
output "ec2_instance_id" { 
  description = "The ID of the EC2 instance" 
  value       = aws_instance.ec2.id 
} 
 
output "ec2_iam_role_arn" { 
  description = "The ARN of the IAM role for the EC2 instance" 
  value       = aws_iam_role.ec2_role.arn 
} 