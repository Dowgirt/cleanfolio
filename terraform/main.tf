resource "google_service_account" "default" {
  account_id   = "devops-sa"
  display_name = "My Service Account"
}

resource "google_container_cluster" "primary_cluster" {
  name                     = "portfolio"
  location                 = local.location
  initial_node_count       = 1
  remove_default_node_pool = true
  deletion_protection      = false
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = local.location
  cluster    = google_container_cluster.primary_cluster.name
  node_count = 1

  node_config {
    preemptible     = true
    service_account = google_service_account.default.email
    machine_type    = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}