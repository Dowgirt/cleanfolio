terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.40.0"
    }
  }
}

provider "google" {
  credentials = file("terraform-key.json")
  project     = local.project
  region      = local.location
}