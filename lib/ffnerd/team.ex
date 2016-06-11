defmodule FFNerd.Team do
  @moduledoc """
  Returns a list of teams.
  """
  defstruct code: nil,
            full_name: nil,
            short_name: nil
  use ExConstructor
  use HTTPoison.Base

  @doc """
  Return a list of all team records.

  ## Examples

    FFNerd.Team.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#teams
  """
  def list(client) do
    FFNerd.get({:NFLTeams, %FFNerd.Url{service: "nfl-teams"}}, client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single team record by team code.

  ## Examples

    FFNerd.Team.find "SEA", client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#teams
  """
  def find(team, client) do
    FFNerd.get({:NFLTeams, %FFNerd.Url{service: "nfl-teams"}}, client)
    |> Stream.map(&new/1)
    |> Enum.find(&(&1.code == team))
  end
end
