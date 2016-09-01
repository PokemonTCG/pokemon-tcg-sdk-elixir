defmodule Pokemon.Query do
  @moduledoc """
  Query Builder
  """

  @doc """
  Finds a resource by id and returns a map
  """
  def find(endpoint, id) do
    {:ok, response} = Pokemon.get("#{endpoint}/#{id}")
    {:ok, body} = response.body
    body
  end

  @doc """
  Finds a resource by id and returns a map
  """
  def where(endpoint, args) do
    all(endpoint, args)
  end

  @doc """
  Finds all resources by parameters and returns a list of maps
  """
  def all(endpoint, args) do
    params = URI.encode_query(args)
    {:ok, response} = Pokemon.get("#{endpoint}?#{params}")
    {:ok, body} = response.body
    body
  end
end
