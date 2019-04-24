provider "aws" {
  region = "us-west-2"
}

## variables
variable "key_name" {
}
## In TFE, it is no longer a file, but the actual contents of the file (which the file function performs on OSS)
variable "key_contents" {}

## -- outputs
output "public-ip" {
    value = "${aws_instance.example.public_ip}" 
}

resource "aws_instance" "example" {
  ami             = "ami-08692d171e3cf02d6"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.example.name}"]
  key_name        = "${ var.key_name }"

}

resource "aws_security_group" "example" {
  name        = "Simple AWS Demo"
  description = "Demo for CI"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

