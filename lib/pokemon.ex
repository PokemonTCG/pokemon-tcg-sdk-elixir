defmodule Pokemon do
  use HTTPoison.Base

  @moduledoc """
    Pokemon TCG API wrapper for Elixir
  """

  @doc """
    Generates default processing URL
  """

  def process_url(endpoint) do
    "https://api.pokemontcg.io/v1/" <> endpoint
  end

  @doc """
    Processes the response to JSON by default
  """

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary
    |> JSX.decode([{:labels, :atom}])

  end
end
