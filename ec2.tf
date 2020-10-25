provider "aws" {
 region = var.aws_region
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "testInstance" {
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.subnet_public.id
  vpc_security_group_ids = [aws_security_group.sg_22.id]
  key_name = aws_key_pair.ec2key.key_name
  user_data = "${file("elk.sh")}"
}