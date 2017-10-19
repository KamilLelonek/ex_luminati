use Mix.Config

config :ex_luminati,
  proxy_host:     "zproxy.luminati.io",
  proxy_port:     22225,
  proxy_username: "lum-customer-crowdmobile-zone-residential",
  proxy_password: "358e1616accd",
  proxy_adapter:  HTTPoison,
  pool_size:      100

import_config "#{Mix.env()}.exs"
