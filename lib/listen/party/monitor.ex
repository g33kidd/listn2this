defmodule Listen.Party.Monitor do

  # duration
  # currentTime
  # paused

  # def start_link(initial_state) do
  #   Agent.start_link(fn -> initial_state end, name: __MODULE__)
  # end
  #
  # # CLIENT API
  #
  # def get_party_state(party) do
  #   Agent.get __MODULE__, fn state ->
  #     get_party_state(state, party)
  #   end
  # end
  #
  # # SERVER API
  #
  # defp get_party_state(state, party) do
  #   case state[party] do
  #     nil ->
  #       state
  #       |> Map.put(party, %{test: 1})
  #       |> Map.get(party)
  #
  #     data ->
  #       state[party]
  #   end
  # end

end
