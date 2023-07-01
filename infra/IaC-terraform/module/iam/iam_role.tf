
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
  }
}

data "aws_iam_policy_document" "policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "ssm:StartSession"
    ]
    resources = var.ssm_allow_arn_list
  }
  statement {
    effect = "Allow"
    actions = [
      "ssm:TerminateSession",
      "ssm:ResumeSession"
    ]
    resources = [
      "arn:aws:ssm:*:*:session/$${aws:username}-*"
    ]
  }
}

resource "aws_iam_role" "ssm_iam_role" {
  name        = "SessionManagerInstanceRole"
  description = "AmazonSSMManagedInstanceCore"
  tags = {
    Name = var.name
    Namespace = "mbx"
    Stage = var.phase
  }
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "ec2-role-policy" {
  name = "SessionManagerInstanceRolePolicy"
  policy = data.aws_iam_policy_document.policy_document.json
  role = aws_iam_role.ssm_iam_role.id
}
resource "aws_iam_instance_profile" "ec2-role-profile" {
  name = "SessionManagerInstanceProfile"
  role = aws_iam_role.ssm_iam_role.id
}

resource "aws_iam_role_policy_attachment" "ssm_iam_role_policy" {
  role       = aws_iam_role.ssm_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}