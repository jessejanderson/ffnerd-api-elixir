defmodule FFNerd.Schedule do
  alias FFNerd.Game

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's NFL Schedule resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """

  @doc """
  Return the associated current week.

  ## Examples

    FFNerd.Schedule.current_week client

  """
  def current_week(client) do
    FFNerd.get({:currentWeek, %FFNerd.URL{service: "schedule"}}, client)
  end

  @doc """
  Return a list of all game records.

  ## Examples

    FFNerd.Schedule.list client

  """
  def list(client) do
    {:Schedule, %FFNerd.URL{service: "schedule"}}
    |> FFNerd.get(client)
    |> Enum.map(&Game.new/1)
  end

  @doc """
  Return a list of game records by team code.

  ## Examples

    FFNerd.Schedule.list client

  """
  def list(team, client) do
    client
    |> list
    |> Enum.filter(fn(x) ->
         x.home_team == "#{team}" ||
         x.away_team == "#{team}"
       end)
  end

  @doc """
  Return a single game record by game id.

  ## Examples

    FFNerd.Schedule.list client

  """
  def find(id, client) do
    client |> list |> Enum.find(&(&1.game_id == "#{id}"))
  end
end
