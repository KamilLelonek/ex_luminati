defmodule ExLuminati.Pool do
  alias ExLuminati.Agent

  def acquire(proxy_username),
    do: "#{proxy_username}-session-rand#{next_session()}"

  defp next_session,
    do: Agent.next()
end
