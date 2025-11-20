# Artifact Registry: Docker repository
resource "google_artifact_registry_repository" "weather_repo" {
  provider = google
  location = var.region
  repository_id = var.artifact_repo_name
  description   = "Repository for weather API Docker images"
  format        = "DOCKER"
}