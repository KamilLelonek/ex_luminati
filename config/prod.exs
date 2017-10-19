use Mix.Config

config :ex_luminati,
  proxy_username: System.get_env("PROXY_USERNAME"),
  proxy_password: System.get_env("PROXY_PASSWORD")
