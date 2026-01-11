resource "aws_iam_role" "ec2_role" {
  name = "secure-cloud-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_read_only" {
  name        = "secure-cloud-ec2-readonly"
  description = "Minimal read-only permissions for EC2 instance learning scope"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:DescribeInstances",
          "ec2:DescribeVolumes",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_read_only" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_read_only.arn
}
