provider "aws" {
  region = "us-west-1"  # Change this to your desired AWS region
}

resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (be cautious)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-01eb4eefd88522422"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"               # Change instance type as needed

  tags = {
    Name = "MyTerraformInstance"
  }

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
}

