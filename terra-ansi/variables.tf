variable "AWS_REGION" {
  description = "Region for aws resources"
  default     = "us-east-1"
}

variable "INSTANCE_TYPE" {
  description = "Type of instance to be used"
  default     = "t3.micro"
}
