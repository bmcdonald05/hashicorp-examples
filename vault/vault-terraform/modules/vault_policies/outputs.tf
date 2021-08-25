output "admin_policy_name" {
  value = vault_policy.admins.name
}

output "secret_manager_policy_name" {
  value = vault_policy.secret_manager.name
}
