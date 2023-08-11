# Security group creation
resource "aws_security_group" "rds_security_group_1" {
  vpc_id = aws_vpc.vpc_1.id

  name        = "security-group-rds-1"
  description = "Security Group RDS 1"

  # Inbound port configuration
  ingress {
    description = "Allow inbound traffic on port 5432 for PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"

    #ts:skip=AC_AWS_0351
    cidr_blocks = [
      var.private_subnet_1a_cidr,
      var.private_subnet_1b_cidr,
      var.private_subnet_1c_cidr
    ]
  }

  # Outbound port configuration
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #tfsec:ignore:aws-vpc-no-public-egress-sgr
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.vpc_1]
}
