variable "ami" { 
  description = "AMI ID for the EC2 instance" 
  type        =  string 
} 
 
variable "instance_type" { 
  description = "Instance type to use for EC2" 
  type        =  string 
  default     = "t2.micro" 
} 
 
variable "key_name" { 
  description = "SSH key pair name" 
  type        = string 
} 
 
variable "security_group_name" { 
  description = "Name of the security group" 
  type        = string 
} 
 
variable "allowed_cidrs" { 
  description = "Allowed CIDRs for security group rules" 
  type        = list(string) 
} 
 
variable "iam_role_name" { 
  description = "Name of the IAM role for the instance" 
  type        = string 
} 
 
variable "iam_instance_profile_name" { 
  description = "Name of the IAM instance profile" 
  type        = string 
} 
 
variable "tags" { 
  description = "Tags to apply to resources" 
  type        = map(string) 
  default     = {} 
} 