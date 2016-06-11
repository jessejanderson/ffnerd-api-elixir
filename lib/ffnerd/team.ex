defmodule FFNerd.Team do
  defstruct [:code, :full_name, :short_name]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Bye Week resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#teams
  """

  @doc """
  Return a list of all team records.

  ## Examples

    FFNerd.Team.list client

  """
  def list(client) do
    {:NFLTeams, %FFNerd.URL{service: "nfl-teams"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single team record by team code.

  ## Examples

    FFNerd.Team.find "SEA", client

  """
  def find(team, client) do
    {:NFLTeams, %FFNerd.URL{service: "nfl-teams"}}
    |> FFNerd.get(client)
    |> Stream.map(&new/1)
    |> Enum.find(&(&1.code == team))
  end
end
