# Cloud Build Trigger
resource "google_cloudbuild_trigger" "weather_api_trigger" {
  name = "weather-api-auto-deploy"

  github {
    owner = var.github_owner
    name = var.github_repo

    push {
      branch = "^main$" # trigger - push to main
    }
  }

  filename = "cloudbuild.yaml"
}