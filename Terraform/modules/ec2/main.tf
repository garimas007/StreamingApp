resource "aws_instance" "EC2" {
  count = 2
  ami = var.AMI
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.SUBNET_ID
  security_groups = var.SECURITY_GROUPS
}