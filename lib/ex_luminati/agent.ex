defmodule ExLuminati.Agent do
  use Agent

  @pool_size Application.get_env(:ex_luminati, :pool_size)

  def start_link(_opts),
    do: Agent.start_link(initial_counter(), name: __MODULE__)

  defp initial_counter,
    do: fn -> 0 end

  def next,
    do: Agent.get_and_update(__MODULE__, &increment/1)

  defp increment(counter),
    do: {counter, increment_counter(counter)}

  defp increment_counter(counter) do
    counter
    |> Kernel.+(1)
    |> rem(@pool_size)
  end
end
