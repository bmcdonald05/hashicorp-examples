datacenter          = "us-east-1"
data_dir            = "/opt/consul/data"
advertise_addr      = "10.0.0.1"
client_addr         = "127.0.0.1"
log_level           = "INFO"
ui                  = true

# AWS cloud join
retry_join          = ["provider=aws tag_key=Environment-Name tag_value=vault-cluster-example-consul"]

addresses {
  http              = "0.0.0.0"
}

ports {
  http              = 7500
  dns               = -1
  server            = 7300
  serf_lan          = 7301
  serf_wan          = -1
}

acl {
  enable_token_persistence = true
  tokens {
    agent = "12345678-c9f7-94bf-8909abfc7642"
  }
}

encrypt = "12345678abcdefgOtKUNR3npnWshNTU0pTVbZY6YPg="
