resource "aws_ecr_repository" "repository" {
  name                 = "boilerplate"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "project" = "boilerplate"
  }
}