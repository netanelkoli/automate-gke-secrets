locals {
  secrets_map = [
    {
      name               = "demo-password-1"
      autogenerate       = true
      chars_count        = 24
      use_special_charts = false
    },
    {
      name               = "demo-password-2"
      autogenerate       = true
      chars_count        = 32
      use_special_charts = false
    }
  ]
}
