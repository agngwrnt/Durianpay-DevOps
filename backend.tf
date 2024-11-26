terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-bucket"
    key            = "${terraform.workspace}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
