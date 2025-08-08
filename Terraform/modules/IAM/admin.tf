# IAM Role for Admin
resource "aws_iam_role" "admin_role" {
    name = "AdminRole"
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })

    tags = {
        Name = "AdminRole"
        Environment = "dev"
    }
}

# Attach AWS managed policy for admin access
resource "aws_iam_role_policy_attachment" "admin_policy" {
    role       = aws_iam_role.admin_role.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Instance profile for EC2 (if needed)
resource "aws_iam_instance_profile" "admin_profile" {
    name = "AdminInstanceProfile"
    role = aws_iam_role.admin_role.name
}
