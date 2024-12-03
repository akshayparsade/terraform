provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_iam_user" "example_user" {
  name = "example-user"
}

resource "aws_iam_user_policy_attachment" "s3_full_access" {
  user       = aws_iam_user.example_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.example_user.name
}

resource "aws_iam_user_login_profile" "example_login_profile" {
  user                  = aws_iam_user.example_user.name
  password              = " # Replace with a strong password
  password_reset_required = true # Forces the user to reset password on first login
}

