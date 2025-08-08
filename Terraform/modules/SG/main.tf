resource "aws_security_group" "sg" {
  name = "development_sg"
  
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      description = "Allow inbound traffic on port ${ingress.value}"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  # ingress {   // for all traffic
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  #   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    description = "Allow all outbound traffic"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
