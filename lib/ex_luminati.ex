defmodule ExLuminati do
  @proxy_host     Application.get_env(:ex_luminati, :proxy_host)
  @proxy_port     Application.get_env(:ex_luminati, :proxy_port)
  @proxy_username Application.get_env(:ex_luminati, :proxy_username)
  @proxy_password Application.get_env(:ex_luminati, :proxy_password)
  @proxy_adapter  Application.get_env(:ex_luminati, :proxy_adapter)

  @proxy        {@proxy_host, @proxy_port}
  @proxy_config [proxy: @proxy]

  def get(url, headers \\ [], opts \\ []),
    do: @proxy_adapter.get(url, headers, options(opts))

  defp options(opts),
    do: proxy_config() ++ opts

  defp proxy_config,
    do: @proxy_config ++ proxy_auth()

  defp proxy_auth,
    do: [proxy_auth: proxy_credentials()]

  defp proxy_credentials,
    do: {random_session(), @proxy_password}

  defp random_session,
    do: @proxy_username <> "-session-rand" <> random_number()

  defp random_number do
    1_000..10_000
    |> Enum.random()
    |> Integer.to_string()
  end
end
