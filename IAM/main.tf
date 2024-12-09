provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

# Create IAM User
resource "aws_iam_user" "iam_user" {
  name = "tf_user"
}

# Attach AWS S3 Full Access Policy
resource "aws_iam_user_policy" "s3_full_access" {
  name   = "s3_full_access"
  user   = aws_iam_user.iam_user.name
  policy = data.aws_iam_policy_document.s3_policy.json
}

# Define S3 Full Access Policy Document
data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

# Create Access Keys for Programmatic Access
resource "aws_iam_access_key" "iam_user_key" {
  user = aws_iam_user.iam_user.name
}

# Allow IAM User Console Login by attaching Login Profile
resource "aws_iam_user_login_profile" "iam_user_login" {
  user               = aws_iam_user.iam_user.name
  password           = "TemporaryPassword123!" # Change this password as needed
  password_reset_required = true
}

output "access_key_id" {
  value = aws_iam_access_key.iam_user_key.id
  sensitive = true
}

output "secret_access_key" {
  value = aws_iam_access_key.iam_user_key.secret
  sensitive = true
}
