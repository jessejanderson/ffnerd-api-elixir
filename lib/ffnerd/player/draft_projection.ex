defmodule FFNerd.Player.DraftProjection do
  defstruct [:attempts, :completions, :display_name, :fantasy_points, :passing_int, :passing_td, :passing_yards, :player_id, :rush_td, :rush_yards, :team]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Draft Projection resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#draft-projections
  """

  @doc """
  Return a list of draft projection records by position.

  ## Examples

    FFNerd.Player.DraftProjection.list "QB", client

    FFNerd.Player.DraftProjection.list :ppr, "QB", client

  """
  def list(position, client) do
    {:DraftProjections, %FFNerd.URL{service: "draft-projections", path1: position}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single draft ranking projection by person id.

  ## Examples

    FFNerd.Player.DraftProjection.find 259, client

    FFNerd.Player.DraftProjection.find :ppr, 259, client

  """
  def find(id, position, client) do
    list(position, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end

