# terraform {
#   required_providers {
#     mycloud = {
#       source  = "hashicorp/google"
#       version = ">= 3.5.0"
#     }
#   }
# }

provider "google" {
    version = "3.5.0"
    credentials = file("${path.module}/tfsvc.json")

    project = "gcp-playground-305516"
    region = "us-east1"
    zone = "us-east1-c"   
}

resource "google_compute_instance" "appserver" {
  name = "test-server"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image="debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}