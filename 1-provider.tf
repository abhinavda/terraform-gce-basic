terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("ardent-dream-337620-ac612f7b334e.json")

  project = "ardent-dream-337620"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_compute_instance" "appserver" {
  name = "primary-application"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
  }
}