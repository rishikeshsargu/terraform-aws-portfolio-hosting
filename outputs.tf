output "ec2-public-ip" {
    value = aws_instance.r_ec2.public_ip
  
}

output "vpc-id" {
    value = aws_vpc.code_vpc1.id
  
}