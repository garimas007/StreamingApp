variable "AMI" {
  description = "ami for the ec2 instance"
}

variable "INSTANCE_TYPE" {
  description = "type of instance to use"
}

variable "SECURITY_GROUPS" {
  description = "security groups to assign to the ec2"
}

variable "SUBNET_ID" {
  description = "subnet to assign to the ec2"
}
