defmodule Pokemon.Supertype do
  @moduledoc """
  Supertype API Endpoint
  """

  @endpoint "supertypes"

  @doc """
  Prints the endpoint name
  """
  def resource do
    @endpoint
  end

  @doc """
  Returns all supertypes as a list
  """
  def all do
    Pokemon.Query.all(@endpoint, %{}).supertypes
  end
end
