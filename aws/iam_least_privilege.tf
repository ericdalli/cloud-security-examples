resource "aws_iam_role" "app_readonly_role" {
  name = "app-readonly-role"

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

  tags = {
    Name        = "app-readonly-role"
    Environment = "demo"
  }
}

resource "aws_iam_policy" "app_readonly_policy" {
  name        = "app-readonly-policy"
  description = "Least-privilege read-only policy for specific S3 bucket and CloudWatch logs."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowReadSpecificBucket"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::example-secure-logs-bucket",
          "arn:aws:s3:::example-secure-logs-bucket/*"
        ]
      },
      {
        Sid    = "AllowReadCloudWatchLogs"
        Effect = "Allow"
        Action = [
          "logs:GetLogEvents",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "app_readonly_attach" {
  role       = aws_iam_role.app_readonly_role.name
  policy_arn = aws_iam_policy.app_readonly_policy.arn
}
