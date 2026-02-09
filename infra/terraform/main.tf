provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name        = "portfolio-sg"
  description = "Allow SSH and app port"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App port"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  tags = {
    Name = "devops-portfolio"
  }
}
