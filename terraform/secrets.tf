module "secrets" {
  count               = length(local.secrets_map)
  source              = "./modules/gcp/backend_dynamic_secrets"
  gcp_project_id      = var.gcp_project_id
  name                = lookup(local.secrets_map[count.index], "name")
  autogenerate_secert = lookup(local.secrets_map[count.index], "autogenerate")
  use_special_chars   = lookup(local.secrets_map[count.index], "use_special_chars", false)
  chars_count         = lookup(local.secrets_map[count.index], "chars_count")
  secret_value        = lookup(local.secrets_map[count.index], "secret_value", "")
}
