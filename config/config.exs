use Mix.Config

config :ex_luminati,
  proxy_host:     "zproxy.luminati.io",
  proxy_port:     22225,
  proxy_username: "",
  proxy_password: "",
  proxy_adapter:  HTTPoison,
  pool_size:      100

import_config "#{Mix.env()}.exs"
