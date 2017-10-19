defmodule ExLuminati do
  alias ExLuminati.Proxy

  @proxy_adapter Application.get_env(:ex_luminati, :proxy_adapter)

  def get(url, headers \\ [], opts \\ []),
    do: @proxy_adapter.get(url, headers, config(opts))

  defp config(opts),
    do: opts ++ Proxy.config()
end
