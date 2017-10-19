defmodule ExLuminati.Auth do
  alias ExLuminati.Pool

  @proxy_username Application.get_env(:ex_luminati, :proxy_username)
  @proxy_password Application.get_env(:ex_luminati, :proxy_password)

  def credentials,
    do: {acquire_ip(), @proxy_password}

  defp acquire_ip,
    do: Pool.acquire(@proxy_username)
end
