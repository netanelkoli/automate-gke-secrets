resource "google_secret_manager_secret" "secret" {
  project   = var.project_id
  secret_id = var.id
  labels    = var.labels
  replication {
    dynamic "user_managed" {
      for_each = length(var.replication_locations) > 0 ? [1] : []
      content {
        dynamic "replicas" {
          for_each = var.replication_locations
          content {
            location = replicas.value
          }
        }
      }
    }
    automatic = length(var.replication_locations) > 0 ? null : true
  }
}

resource "google_secret_manager_secret_version" "secret" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret
}

resource "google_secret_manager_secret_iam_member" "secret" {
  count     = length(var.accessors)
  project   = var.project_id
  secret_id = google_secret_manager_secret.secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = element(var.accessors, count.index)
}
