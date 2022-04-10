resource "aws_ecr_repository" "myapp" {
  name = "myapp"
}

resource "docker_registry_image" "myapp" {
  name = "${aws_ecr_repository.myapp.repository_url}/myapp:latest"
  build{
    context = "./docker-demo"
    dockerfile = "Dockerfile"
  }
}