terraform {
  required_providers {
    docker = {
        version = "2.16.0"
        source = "kreuzwerker/docker"
    }
  }

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "pablosspot"

    workspaces {
      prefix = "event-driven-system-myapp"
    }

}

}