defmodule Pokemon.Subtype do
  @moduledoc """
  Subtype API Endpoint
  """

  @endpoint "subtypes"

  def resource do
    @endpoint
  end

  @doc """
  Returns all subtypes as a list
  """
  def all do
    Pokemon.Query.all(@endpoint, %{}).subtypes
  end
end
