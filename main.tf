provider "aws" {
  region = "ca-central-1"  # Replace with your desired AWS region
}

resource "aws_instance" "web_server_implicit" {
  ami           = "ami-0b18956f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_implicit.id

  tags = {
    Name = "Web Server Implicit"
  }
  
}

resource "aws_subnet" "public_subnet_implicit" {
  vpc_id         = aws_vpc.main_vpc.id
  cidr_block     = "10.0.1.0/24"
  availability_zone = "ca-central-1a"
  
}

resource "aws_security_group" "web_sg_implicit" {
  name        = "web_sg"
  description = "Web Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc_implicit"
  }
}