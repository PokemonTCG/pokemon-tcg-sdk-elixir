defmodule Pokemon.Type do
  @moduledoc """
  Type API Endpoint
  """

  @endpoint "types"

  @doc """
  Prints the endpoint name
  """
  def resource do
    @endpoint
  end

  @doc """
  Returns all types as a list
  """
  def all do
    Pokemon.Query.all(@endpoint, %{}).types
  end
end
