resource "aws_iam_user" "User1" {
  name = "Name1"
  path = "/"

}

resource "aws_iam_user" "User2" {
  name = "Name2"
  path = "/custom_path/"

}