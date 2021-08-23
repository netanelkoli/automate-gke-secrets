resource "google_service_account" "service_account" {
  account_id   = "demo-external-secrets-sa"
  display_name = "demo-external-secrets-sa"
  description  = "Service account to access the secret manager for External Secrets application."
  project      = var.project_id
}

resource "google_service_account_iam_binding" "sa_iam_member_bind" {
  service_account_id = google_service_account.service_account.id
  role               = "roles/iam.workloadIdentityUser"
  members            = ["serviceAccount:${var.gcp_project_id}.svc.id.goog[shared/shared-kubernetes-external-secrets]"]
}

resource "google_project_iam_member" "project_iam_member" {
  project = var.project_id
  role    = "roles/secretmanager.admin"
  member  = "serviceAccount:google_service_account.service_account.email"
}
