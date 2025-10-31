
resource "aws_security_group" "ec2_sg" { 
  name        = var.security_group_name 
  description = "Security group for EC2 instance" 
 
  ingress { 
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp" 
    cidr_blocks = var.allowed_cidrs 
  } 
 
  ingress { 
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp" 
    cidr_blocks = var.allowed_cidrs 
  } 
 
  egress { 
    from_port   = 0 
    to_port     = 0 
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
  } 
} 
 
resource "aws_iam_role" "ec2_role" { 
  name = var.iam_role_name 
 
  assume_role_policy = jsonencode({ 
    Version = "2012-10-17" 
    Statement = [{ 
      Action = "sts:AssumeRole" 
      Effect = "Allow" 
      Principal = { 
        Service = "ec2.amazonaws.com" 
      } 
    }] 
  }) 
} 
 
resource "aws_instance" "ec2" { 
  ami           = var.ami 
  instance_type = var.instance_type 
  key_name      = var.key_name 
 
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name 
  security_groups      = [aws_security_group.ec2_sg.name] 
 
  tags = var.tags 
} 
 
resource "aws_iam_instance_profile" "ec2_profile" { 
  name = var.iam_instance_profile_name 
  role = aws_iam_role.ec2_role.name 
} 