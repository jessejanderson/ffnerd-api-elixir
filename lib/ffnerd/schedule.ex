defmodule FFNerd.Schedule do
  alias FFNerd.Game
  use HTTPoison.Base

  @doc """
  Return the associated current week.

  ## Examples

    FFNerd.Schedule.current_week client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def current_week(client) do
    FFNerd.get({:currentWeek, %FFNerd.Url{service: "schedule"}}, client)
  end

  @doc """
  Return a list of all game records.

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def list(client) do
    FFNerd.get({:Schedule, %FFNerd.Url{service: "schedule"}}, client)
    |> Enum.map(&Game.new/1)
  end

  @doc """
  Return a list of game records by team code.

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def list(team, client) do
    list(client)
    |> Enum.filter(fn(x) ->
         x.home_team == "#{team}" ||
         x.away_team == "#{team}"
       end)
  end

  @doc """
  Return a single game record by game id.

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def find(id, client) do
    list(client) |> Enum.find(&(&1.game_id == "#{id}"))
  end
end
