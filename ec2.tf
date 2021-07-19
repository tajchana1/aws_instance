terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "jenkins-instance" {
  ami           = "ami-03ac5a9b225e99b02"
  instance_type = "t2.micro"
  iam_instance_profile = "SSMRoleEC2"
  key_name = "terraformtest"
  security_groups = ["allow_jenkins"]
  user_data = file("install_jenkins.sh")
  

  tags = {
   Name = "Jenkins-Instance"
  }
}

resource "aws_security_group" "jenkins" {
  name        = "allow_jenkins"
  description = "Allow SSH and Jenkins inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_jenkins"
  }
}
