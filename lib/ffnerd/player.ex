defmodule FFNerd.Player do
  defstruct [:player_id, :star, :active, :jersey, :fname, :lname, :display_name, :team, :position, :height, :weight, :dob, :college, :twitter_id]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Players resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """

  @doc """
  Return a list of all player records.

  ## Examples

    FFNerd.Player.list client

  """
  def list(client) do
    {:Players, %FFNerd.URL{service: "players"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of player records by position code.

  ## Examples

    FFNerd.Player.list "QB", client

  """
  def list(position, client) do
    {:Players, %FFNerd.URL{service: "players", path1: position}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single player record by player id.

  ## Examples

    FFNerd.Player.find 2, client

  """
  def find(id, client) do
    client |> list |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
