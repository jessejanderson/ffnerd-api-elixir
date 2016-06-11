defmodule FFNerd.Weather do
  defstruct [:game_id, :game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station, :stadium, :is_dome, :geo_lat, :geo_long, :low, :high, :forecast, :wind_chill, :wind_speed, :dome_img, :small_img, :medium_img, :large_img]
  use ExConstructor
  use HTTPoison.Base

  @doc """
  Return the associated current date.

  ## Examples

    FFNerd.Schedule.today client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weather
  """
  def today(client) do
    FFNerd.get({:Today, %FFNerd.Url{service: "weather"}}, client)
  end

  @doc """
  Return the associated current week.

  ## Examples

    FFNerd.Schedule.week client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """
  def week(client) do
    FFNerd.get({:Week, %FFNerd.Url{service: "weather"}}, client)
  end

  @doc """
  Return a list of all weather forecast records.

  ## Examples

    FFNerd.Schedule.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weather
  """
  def list(client) do
    FFNerd.get({:Games, %FFNerd.Url{service: "weather"}}, client)
    |> Enum.map(fn{k, v} -> new(v) end)
  end

  @doc """
  Return a single weather forecast record by game id.

  ## Examples

    FFNerd.Weather.find 2, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weather
  """
  def find(id, client) when is_integer(id) do
    list(client) |> Enum.find(&(&1.game_id == "#{id}"))
  end

  @doc """
  Return a single weather forecast record by team code.

  ## Examples

    FFNerd.Weather.find "SEA", client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weather
  """
  def find(team, client) do
    list(client)
    |> Enum.find(fn(x) ->
         x.home_team == "#{team}" ||
         x.away_team == "#{team}"
       end)
  end
end
