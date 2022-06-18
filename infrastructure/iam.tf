resource "aws_iam_user" "deployer" {
  name = "deploy-user"

  tags = {
    project = var.project_name
  }
}

resource "aws_iam_access_key" "deployer" {
  user = aws_iam_user.deployer.name
}

data "aws_iam_policy_document" "deployer" {
  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetLifecyclePolicy",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]

    resources = [
      aws_ecr_repository.repository.arn,
    ]
  }

  depends_on = [
    aws_ecr_repository.repository
  ]
}

resource "aws_iam_user_policy" "deployer" {
  name = "deployer-policy"
  user = aws_iam_user.deployer.name
  policy = data.aws_iam_policy_document.deployer.json
}
