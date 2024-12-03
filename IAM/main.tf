provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_iam_user" "Dev_user" {
  name = "Dev"
}

resource "aws_iam_user_policy_attachment" "s3_full_access" {
  user       = aws_iam_user.Dev_user.Dev
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_access_key" "Dev_access_key" {
  user = aws_iam_user.Dev_user.Dev
}

resource "aws_iam_user_login_profile" "Dev_login_profile" {
  user                  = aws_iam_user.Dev_user.Dev
  password              = "SuperSecurePassword123!" # Replace with a strong password
  password_reset_required = true # Forces the user to reset password on first login
}

output "access_key_id" {
  value = aws_iam_access_key.example_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.example_access_key.secret
  sensitive = true
}

output "console_login_url" {
  value = "https://console.aws.amazon.com/"
}
