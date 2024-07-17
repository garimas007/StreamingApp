resource "aws_instance" "frontend-ec2" {
  count           = 2
  ami             = var.AMI
  instance_type   = var.INSTANCE_TYPE
  subnet_id       = [var.SUBNET_ID]
  security_groups = [var.SECURITY_GROUPS]

  tags = {
    Name = "frontend-ec2-${count.index}"
  }
}

resource "aws_instance" "backend-ec2" {
  count           = 2
  ami             = var.AMI
  instance_type   = var.INSTANCE_TYPE
  subnet_id       = [var.SUBNET_ID]
  security_groups = [var.SECURITY_GROUPS]

  tags = {
    Name = "backend-ec2-${count.index}"
  }
}
