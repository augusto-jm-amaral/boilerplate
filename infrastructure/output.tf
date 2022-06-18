output "deployer-access-key-secret" {
  value     = aws_iam_access_key.deployer.secret
  sensitive = true
}

output "deployer-access-key-id" {
  value = aws_iam_access_key.deployer.id
}
