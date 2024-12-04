resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}-db-sg"
  description = "Allow database access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306                       
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]            
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "app_db" {
  allocated_storage    = 20
  engine               = "postgres"            
  engine_version       = "12.15"               
  instance_class       = "db.m5.large"      
  db_name              = "app_db"            
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "${var.project_name}-db"
    Environment = var.environment
  }
}

output "db_endpoint" {
 
  value       = aws_db_instance.app_db.endpoint
}

output "db_security_group_id" {
 
  value       = aws_security_group.db_sg.id
}

output "db_name" {
  value       = aws_db_instance.app_db.db_name
}

