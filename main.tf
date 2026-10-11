resource "google_identity_platform_oauth_idp_config" "identity_platform_oauth_idp_configs" {
  for_each = var.identity_platform_oauth_idp_configs

  client_id       = each.value.client_id
  issuer          = each.value.issuer
  name            = each.value.name
  client_secret   = each.value.client_secret
  deletion_policy = each.value.deletion_policy
  display_name    = each.value.display_name
  enabled         = each.value.enabled
  project         = each.value.project

  dynamic "response_type" {
    for_each = each.value.response_type != null ? [each.value.response_type] : []
    content {
      code     = response_type.value.code
      id_token = response_type.value.id_token
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

