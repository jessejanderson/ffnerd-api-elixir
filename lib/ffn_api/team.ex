defmodule FfnApi.Team do
  use HTTPoison.Base
  import FfnApi.Utils

  def list(client) do
    FfnApi.get({:NFLTeams, %FfnApi.Url{service: "nfl-teams"}}, client)
    |> Enum.map(&convert_to_atom_map/1)
  end

  def list(position, client) do
    FfnApi.get({:NFLTeams, %FfnApi.Url{service: "nfl-teams", path1: position}}, client)
    |> Enum.map(&convert_to_atom_map/1)
  end
end
