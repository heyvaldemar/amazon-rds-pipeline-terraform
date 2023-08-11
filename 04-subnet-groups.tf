resource "aws_db_subnet_group" "subnet_group_1" {
  name = var.subnet_group_1_name

  subnet_ids = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_1b.id,
    aws_subnet.private_subnet_1c.id
  ]

  tags = {
    Name = "subnet-group-rds-1"
  }
}
