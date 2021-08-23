resource "random_password" "password" {
  count   = var.autogenerate_secert ? 1 : 0
  length  = var.chars_count
  special = var.use_special_chars
}

module "genrated_secrets" {
  source     = "../secret_manager"
  project_id = var.gcp_project_id
  id         = var.name
  secret     = var.autogenerate_secert ? random_password.password[0].result : var.secret_value
}
