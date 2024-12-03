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
