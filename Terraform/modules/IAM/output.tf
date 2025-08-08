output "admin_role_arn" {
    value = aws_iam_role.admin_role.arn
}
output "admin_profile" {
    value = aws_iam_instance_profile.admin_profile.name
}
