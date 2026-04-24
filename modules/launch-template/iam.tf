########################################
# EC2 IAM Role
########################################

resource "aws_iam_role" "app_ec2_role" {
  name = "${var.name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

########################################
# EC2 Instance Profile
########################################

resource "aws_iam_instance_profile" "app_ec2_profile" {
  name = "${var.name}-ec2-profile"
  role = aws_iam_role.app_ec2_role.name
}

########################################
# Secrets Manager Policy
########################################

resource "aws_iam_policy" "read_db_secret" {
  name = "${var.name}-read-db-secret"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue"]
      Resource = "arn:aws:secretsmanager:ap-south-1:${var.account_id}:secret:preprod/db/credentials*"
    }]
  })
}

########################################
# Attach Policy to EC2 Role
########################################

resource "aws_iam_role_policy_attachment" "attach_db_secret" {
  role       = aws_iam_role.app_ec2_role.name
  policy_arn = aws_iam_policy.read_db_secret.arn
}