defmodule Pokemon.Set do
  @moduledoc """
  Set API Endpoint
  """

  @endpoint "sets"

  @doc """
  Prints the endpoint name
  """
  def resource do
    @endpoint
  end

  @doc """
  Finds a set by id and returns a map
  """
  def find(id) do
    Pokemon.Query.find(@endpoint, id).set
  end

  @doc """
  Finds sets by parameters and returns a list of maps
  """
  def where(args) do
    all(args)
  end

  @doc """
  Finds all cards by parameters and returns a list of maps
  ## Arguments
      page (integer)
      pageSize (integer)
      standardLegal (boolean)
  """
  def all(args \\ %{ page: 1, pageSize: 100 }) do
    Pokemon.Query.all(@endpoint, args).sets
  end
end
