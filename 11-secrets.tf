data "aws_secretsmanager_secret_version" "rds_secret_1" {
  secret_id = var.secret_1_arn
}

locals {
  rds_credentials_1 = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_1.secret_string)
}
