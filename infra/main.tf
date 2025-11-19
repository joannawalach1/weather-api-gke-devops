terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" 
    }
  }
}

provider "google" {
  project = "group-project-478615"
  region  = "us-central1" 
}

# Sieć VPC 
resource "google_compute_network" "main" {
  name                    = "gke-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  name          = "gke-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.main.id
}

# Klaster GKE
resource "google_container_cluster" "primary" {
  name     = "moj-gke-klaster"
  location = "us-central1"

  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.main.name

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {}
}

# Node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-nodes"
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-micro"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# Artifact Registry: Docker repository
resource "google_artifact_registry_repository" "weather_repo" {
  provider = google
  location = "us-central1"
  repository_id = "weather-repo"
  description   = "Repository for weather API Docker images"
  format        = "DOCKER"
}

# Pobranie danych o projekcie (numer projektu jest potrzebny do nazwy konta Cloud Build)
data "google_project" "project" {}

# Cloud Build: pozwolenie na push do Artifact Registry
resource "google_project_iam_member" "cloudbuild_artifact_registry" {
  project = data.google_project.project.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

# Cloud Build: pozwolenie na deploy do GKE (kubectl apply)
resource "google_project_iam_member" "cloudbuild_gke_deploy" {
  project = data.google_project.project.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

# (opcjonalnie) pozwolenie na odczyt kluczy klastrów
resource "google_project_iam_member" "cloudbuild_cluster_viewer" {
  project = data.google_project.project.project_id
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

