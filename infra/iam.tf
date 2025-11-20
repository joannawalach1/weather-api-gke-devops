# Pobranie danych o projekcie (numer projektu jest potrzebny do nazwy konta Cloud Build)
data "google_project" "project" {}

# Cloud Build: pozwolenie na push do Artifact Registry
resource "google_project_iam_member" "cloudbuild_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

# Cloud Build: pozwolenie na deploy do GKE (kubectl apply)
resource "google_project_iam_member" "cloudbuild_gke_deploy" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

# (opcjonalnie) pozwolenie na odczyt kluczy klastrów
resource "google_project_iam_member" "cloudbuild_cluster_viewer" {
  project = var.project_id
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}