defmodule FFNerd.WeeklyRanking do
  defstruct [:game_status, :injury, :last_update, :name, :player_id, :position, :ppr, :ppr_low, :ppr_high, :practice_status, :standard, :standard_low, :standard_high, :team, :week]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Weekly Ranking resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weekly-rankings
  """

  @doc """
  Return a list of weekly ranking records by position using the current week.

  ## Examples

  FFNerd.WeeklyRanking.list "QB", client

  """
  def list(position, client) do
    {:Rankings, %FFNerd.URL{service: "weekly-rankings", path1: position}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of weekly ranking records by position and week.

  ## Examples

    FFNerd.WeeklyRanking.list "QB", client

  """
  def list(position, week, client) do
    {:Rankings, %FFNerd.URL{service: "weekly-rankings", path1: position, path2: week}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single weekly ranking record by person id.

  ## Examples

    FFNerd.WeeklyRanking.find 259, client

  """
  def find(id, position, client) do
    list(position, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
