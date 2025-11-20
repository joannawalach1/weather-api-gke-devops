# Cloud Build Trigger
resource "google_cloudbuild_trigger" "weather_api_trigger" {
  name = "weather-api-auto-deploy"
  location = var.region
  trigger_template {
    branch_name = "main"
    repo_name = var.github_repo
  }

  filename = "cloudbuild.yaml"
}
