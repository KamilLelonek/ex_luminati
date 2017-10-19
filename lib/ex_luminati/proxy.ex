defmodule ExLuminati.Proxy do
  alias ExLuminati.Auth

  @proxy_host Application.get_env(:ex_luminati, :proxy_host)
  @proxy_port Application.get_env(:ex_luminati, :proxy_port)

  @proxy        {@proxy_host, @proxy_port}
  @proxy_config [proxy: @proxy]

  def config,
    do: @proxy_config ++ proxy_auth()

  defp proxy_auth,
    do: [proxy_auth: credentials()]

  defp credentials,
    do: Auth.credentials()
end
