resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "AWSEKSAutoScalerAMPolicy"

  policy = var.policy_file
}

resource "aws_iam_role" "this" {
  assume_role_policy = var.role_policy_file
  name               = var.role_name
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.policy.arn
}
