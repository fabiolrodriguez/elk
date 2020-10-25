 
output "aws_ip" {
  value = ["${aws_instance.testInstance.*.public_ip}"]
}