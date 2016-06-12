defmodule FFNerd.Player.AuctionValues do
  defstruct [:avg_price, :display_name, :max_price, :min_price, :player_id, :position, :ppr, :team]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Auction Values resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#auction
  """

  @doc """
  Return a list of auction value records.

  ## Examples

    FFNerd.Player.AuctionValues.list client

    FFNerd.Player.AuctionValues.list :ppr, client

  """
  def list(client) do
    {:AuctionValues, %FFNerd.URL{service: "auction"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  def list(:ppr, client) do
    {:AuctionValues, %FFNerd.URL{service: "auction", path1: "ppr"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of auction value records by position.

  ## Examples

    FFNerd.Player.AuctionValues.list "QB", client

    FFNerd.Player.AuctionValues.list :ppr, "QB", client

  """
  def list(position, client) do
    list(client) |> Enum.filter(&(&1.position == position))
  end

  def list(:ppr, position, client) do
    list(:ppr, client) |> Enum.filter(&(&1.position == position))
  end

  @doc """
  Return a single auction value record by person id.

  ## Examples

    FFNerd.Player.AuctionValues.find 259, client

    FFNerd.Player.AuctionValues.find :ppr, 259, client

  """
  def find(id, client) do
    list(client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  def find(:ppr, id, client) do
    list(:ppr, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end

