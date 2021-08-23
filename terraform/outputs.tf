output "instance1_public_ip" {
  value       = aws_instance.first_instance.public_ip
}

output "instance2_public_ip" {
  value= aws_instance.second_instance.public_ip
}



