defmodule FFNerd.Game do
  defstruct [:game_id, :game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's NFL Schedule resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """

  @doc """
  Convert raw api data to WeeklyProjection struct.
  """
  def new(map) do
    %FFNerd.Game{
      game_id:      map["gameId"],
      game_week:    map["gameWeek"],
      game_date:    map["gameDate"],
      away_team:    map["awayTeam"],
      home_team:    map["homeTeam"],
      game_time_et: map["gameTimeET"],
      tv_station:   map["tvStation"]
    }
  end

  @doc """
  Return a list of all game records.

  ## Examples

    FFNerd.Game.list client

  """
  def list(client), do: FFNerd.Schedule.list(client)

  @doc """
  Return a single game record by game id.

  ## Examples

    FFNerd.Game.find 2, client

  """
  def find(id, client) do
    {:Schedule, %FFNerd.URL{service: "schedule"}}
    |> FFNerd.get(client)
    |> Enum.find(fn(%{"gameId" => game_id}) -> game_id == "#{id}" end)
    |> new
  end
end
