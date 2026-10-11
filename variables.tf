variable "identity_platform_oauth_idp_configs" {
  description = <<EOT
Map of identity_platform_oauth_idp_configs, attributes below
Required:
    - client_id
    - issuer
    - name
Optional:
    - client_secret
    - deletion_policy
    - display_name
    - enabled
    - project
    - response_type (block):
        - code (optional)
        - id_token (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    client_id       = string
    issuer          = string
    name            = string
    client_secret   = optional(string)
    deletion_policy = optional(string)
    display_name    = optional(string)
    enabled         = optional(bool)
    project         = optional(string)
    response_type = optional(object({
      code     = optional(bool)
      id_token = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

