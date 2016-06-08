defmodule FfnApi.Team do
  @moduledoc """
  Returns a list of teams.
  """
  defstruct code: nil,
            full_name: nil,
            short_name: nil
  use ExConstructor
  use HTTPoison.Base

  def list(client) do
    FfnApi.get({:NFLTeams, %FfnApi.Url{service: "nfl-teams"}}, client)
    |> Enum.map(&new/1)
  end
end
