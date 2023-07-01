resource "aws_ecr_repository" "ecr" {
  count = length(var.name)

  name = element(var.name, count.index)
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
        encryption_type = "AES256"
  }

  image_scanning_configuration {
        scan_on_push = false
  }
}

resource "aws_ecr_lifecycle_policy" "ecr" {
    count = length(var.name)

    repository  = "${aws_ecr_repository.ecr[count.index].name}"
    policy      = jsonencode(
        {
            rules = [
                {
                    action       = {
                        type = "expire"
                    }
                    description  = "Expire images older than 14 days"
                    rulePriority = 1
                    selection    = {
                        countNumber = 14
                        countType   = "sinceImagePushed"
                        countUnit   = "days"
                        tagStatus   = "untagged"
                    }
                },
            ]
        }
    )
}
