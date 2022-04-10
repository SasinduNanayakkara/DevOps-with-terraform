provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }

provider "docker" {
  registry_auth {
    address = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.username
    password = data.aws_ecr_authorization_token.token.password
  }
}