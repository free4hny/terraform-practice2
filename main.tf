resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # This is an example Amazon Linux 2 AMI ID, replace with the desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_public_dns" {
  value = aws_instance.example.public_dns
}