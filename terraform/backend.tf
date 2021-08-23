provider "google" {
  project = var.gcp_project_id
}


terraform {
  backend "gcs" {
    bucket         = "demo-state-bucket"
    prefix         = "myproject/state"
    encryption_key = "XXXXXXXXXXXXXXXXXXXXXXX"
  }
}
