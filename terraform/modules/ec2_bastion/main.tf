resource "aws_security_group" "BastionSG" {
  vpc_id = var.vpc_id
  name = "${var.name}-bastion-sg"
  description = "Security group for the bastion host"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

resource "aws_instance" "BastionHost" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.pubsub_subnet_id
    vpc_security_group_ids = [aws_security_group.BastionSG.id]
    key_name = var.key_name
    associate_public_ip_address = true
    tags = var.tags
    availability_zone = var.availability_zone
}