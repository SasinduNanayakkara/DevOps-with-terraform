variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    "us-west-1" = "ami-0e5bb481d1e9c5053"
    "us-west-2" = "ami-01c2228e390c040da"
    "us-east-1" = "ami-0b49a4a6e8e22fa16"
  }
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}