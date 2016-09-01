defmodule Pokemon.Card do
  @moduledoc """
  Card API Endpoint
  """

  @endpoint "cards"

  @doc """
  Prints the endpoint name
  """
  def resource do
    @endpoint
  end

  @doc """
  Finds a card by the card identifier and returns a map
  """
  def find(id) do
    Pokemon.Query.find(@endpoint, id).card
  end

  @doc """
  Finds cards by parameters and returns a list of maps
  """
  def where(args) do
    all(args)
  end

  @doc """
  Finds all cards by parameters and returns a list of maps based
  on page and page size. There is a maximum of 1000 cards per request.
  ## Arguments
      attackCost
      attackDamage
      hp
      name
      page
      pageSize
      retreatCost
      set
      types
      weaknesses
  """
  def all(args \\ %{ page: 1, pageSize: 100 }) do
    Pokemon.Query.all(@endpoint, args).cards
  end

end
