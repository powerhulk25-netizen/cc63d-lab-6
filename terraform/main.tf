provider "google" {
  project = "cc63d-lab6"
  region  = "southamerica-west1"
}

resource "google_artifact_registry_repository" "monolito" {
  repository_id = "monolito"
  location      = "southamerica-west1"
  format        = "DOCKER"
  description   = "Repositorio Docker del laboratorio"
}

resource "google_cloud_run_v2_service" "incidentes" {
  name     = "incidentes"
  location = "southamerica-west1"

  template {
    containers {
      image = "southamerica-west1-docker.pkg.dev/cc63d-lab6/monolito/incidentes:v1"
    }
  }
}