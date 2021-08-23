datacenter          = "us-east-1"
server              = true
bootstrap_expect    = 6
data_dir            = "/opt/consul/data"
advertise_addr      = "10.0.0.1"
client_addr         = "127.0.0.1"
log_level           = "INFO"
ui                  = true

# AWS cloud join
retry_join          = ["provider=aws tag_key=Environment-Name tag_value=vault-cluster-example-consul"]

performance {
    raft_multiplier = 1
}

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
  enabled        = true
  default_policy = "deny"
  enable_token_persistence = true
  tokens {
    master = "abcd1234-8068-af73-80e6-9c534c6f3d16"
    agent  = "efgh1234-c9f7-94bf-8909abfc7642"
  }
}

encrypt = "12345678abcdefgOtKUNR3npnWshNTU0pTVbZY6YPg="
