defmodule FFNerd.Weather do
  defstruct [:game_id, :game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station, :stadium, :is_dome, :geo_lat, :geo_long, :low, :high, :forecast, :wind_chill, :wind_speed, :dome_img, :small_img, :medium_img, :large_img]
  use ExConstructor
  use HTTPoison.Base

  @doc """
  List schedule

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def list(client) do
    FFNerd.get({:Games, %FFNerd.Url{service: "weather"}}, client)
    |> Enum.map(fn{k, v} -> {k, new(v)} end)
    |> Enum.into(%{})
  end

  @doc """
  Find a weather forecast by game id

  ## Examples

    FFNerd.Weather.find 2, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """
  def find(id, client) when is_integer(id) do
    list(client)
    |> Enum.find(fn{_, v} -> v.game_id == "1" end)
    |> elem(1)
  end

  @doc """
  Find a weather forecast by short name

  ## Examples

    FFNerd.Weather.find "SEA", client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """
  def find(team, client) do
    FFNerd.get({:Games, %FFNerd.Url{service: "weather"}}, client)
    |> Map.get("#{team}")
    |> new
  end

  @doc """
  List current date

  ## Examples

    FFNerd.Schedule.today client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def today(client) do
    FFNerd.get({:Today, %FFNerd.Url{service: "weather"}}, client)
  end

  @doc """
  List current week

  ## Examples

    FFNerd.Schedule.week client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def week(client) do
    FFNerd.get({:Week, %FFNerd.Url{service: "weather"}}, client)
  end
end
