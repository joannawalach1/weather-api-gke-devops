variable "project_id" {
  description = "ID of the GCP project"
  type        = string
  default     = "group-project-478615"
}

variable "region" {
  description = "Default region for resources"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "gke-network"
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
  default     = "gke-subnet"
}

variable "github_owner" {
  description = "GitHub owner / organization"
  type        = string
  default     = "joannawalach1"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "weather-api-gke-devops"
}

variable "gke_cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "moj-gke-klaster"
}

variable "gke_machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}

variable "gke_node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "primary-nodes"
}

variable "gke_node_count" {
  description = "Node Count in GKE node pool"
  type        = number
  default     = 1
}

variable "artifact_repo_name" {
  description = "Artifact Registry repository ID"
  type        = string
  default     = "weather-repo"
}
