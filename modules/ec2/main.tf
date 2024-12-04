
resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-ec2-sg"

  vpc_id = var.vpc_id

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

# EC2 instance
resource "aws_instance" "app_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "${var.project_name}-app-instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_instance.public_ip
}
