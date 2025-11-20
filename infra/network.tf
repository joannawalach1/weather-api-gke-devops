# Sieć VPC 
resource "google_compute_network" "main" {
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  name          = var.subnetwork
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.main.id
}
