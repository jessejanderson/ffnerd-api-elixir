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
  List teams

  ## Examples

    FFNerd.Team.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#teams
  """
  def list(client) do
    FFNerd.get({:NFLTeams, %FFNerd.Url{service: "nfl-teams"}}, client)
    |> Enum.map(&new/1)
  end
end
