resource "vault_auth_backend" "gcp" {
  path        = "gcp"
  type        = "gcp"
  description = "GCP auth backend"
}
