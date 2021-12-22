provider “aws” {
	access_key = “AKIA4HA6CIR2TAKSISDM”
	secret key = “qC7R1JQh+gIVBQX+yPN3dhLoyBm4KqrQq+2dfpC6”
	region = “eu-central-1”
}
resource “aws_instance” “Ubuntu” {
	ami = “ami-0a49b025fffbbdac6”
	instance_type = “t2.micro”
        key_name = "katelinux"
vpc_security_group_ids = [
    aws_security_group.allow_web_traffic.id
  ]
}	
resource "aws_security_group" "allow_web_traffic" {
  name = "allow_web_traffic"
  description = "Allow web inbound traffic"
 

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

 
  ingress {
    from_port = 80
    protocol = ""
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}
  
output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}