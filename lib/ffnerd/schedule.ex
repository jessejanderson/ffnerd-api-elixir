defmodule FFNerd.Schedule do
  alias FFNerd.Game
  use HTTPoison.Base

  @doc """
  List schedule

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def list(client) do
    FFNerd.get({:Schedule, %FFNerd.Url{service: "schedule"}}, client)
    |> Enum.map(&Game.new/1)
  end

  @doc """
  List current week

  ## Examples

    FFNerd.Schedule.current_week client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def current_week(client) do
    FFNerd.get({:currentWeek, %FFNerd.Url{service: "schedule"}}, client)
  end
end
