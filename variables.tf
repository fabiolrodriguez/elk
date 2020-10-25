# Terraform variables

variable "terraform_org" {
  description = "terraform organization"
  default = "testecorpfabio"
}

variable "terraform_workspace" {
  description = "terraform workspace"
  default = "zuptest"
}

#AWS Variables

variable "aws_region" {
  description = "AWS Region"
  default = "us-east-2"
}
variable "aws_cidr_vpc" {
  description = "CIDR block for the AWS VPC"
  default = "10.1.0.0/16"
}
variable "aws_cidr" {
  description = "CIDR block for the AWS subnet"
  default = "10.1.0.0/24"
}
variable "aws_az" {
  description = "availability zone to create AWS subnet"
  default = "us-east-2a"
}
variable "aws_instance_ami" {
  description = "AMI for AWS EC2 instance"
  default = "ami-0d5d9d301c853a04a"
}
variable "aws_instance_type" {
  description = "type for AWS EC2 instance"
  default = "t2.micro"
}

variable "aws_vpn_ami" {
  description = "AMI for AWS EC2 instance for OpenVPN"
  default = "ami-0d5d9d301c853a04a"
}

variable "public_key_path" {
  description = "Public key path"
  default = "id_rsa.pub"
}

variable "ssh_user" {
  description = "SSH user on the public key"
  default = "fabiolrodriguez"
}

