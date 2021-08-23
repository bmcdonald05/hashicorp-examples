#This is the local listener
listener "tcp" {
   address = "127.0.0.1:8200" #Use "127.0.0.1:8100" for local dev-server or for port collisions.
   tls_disable = true
}

##This is the Vault cluster address to communicate with the Vault server
vault {
   address = "https://10.10.10.1:8200/" #Cluster Address
}

auto_auth {
  method "approle" {
    namespace = "My-Namespace"
    config = {
      role_id_file_path = "/etc/vault.d/approle/roleID"
      secret_id_file_path = "/etc/vault.d/approle/secretID"
    }
  }
  sink "file" {
    config = {
      path = "/tmp/token"
    }
  }
}
