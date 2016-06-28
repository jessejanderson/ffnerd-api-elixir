defmodule FFNerd.Weather do
  defstruct [
    :away_team,
    :dome_img,
    :forecast,
    :game_date,
    :game_id,
    :game_time_et,
    :game_week,
    :geo_lat,
    :geo_long,
    :high,
    :home_team,
    :is_dome,
    :large_img,
    :low,
    :medium_img,
    :small_img,
    :stadium,
    :tv_station,
    :wind_chill,
    :wind_speed,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Weather Forecasts resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weather
  """

  @doc """
  Convert raw api data to Weather struct.
  """
  def new(map) do
    %FFNerd.Weather{
      away_team:    map["awayTeam"],
      dome_img:     map["domeImg"],
      forecast:     map["forecast"],
      game_date:    map["gameDate"],
      game_id:      map["gameId"],
      game_time_et: map["gameTimeET"],
      game_week:    map["gameWeek"],
      geo_lat:      map["geoLat"],
      geo_long:     map["geoLong"],
      high:         map["high"],
      home_team:    map["homeTeam"],
      is_dome:      map["isDome"],
      large_img:    map["largeImg"],
      low:          map["low"],
      medium_img:   map["mediumImg"],
      small_img:    map["smallImg"],
      stadium:      map["stadium"],
      tv_station:   map["tvStation"],
      wind_chill:   map["windChill"],
      wind_speed:   map["windSpeed"]
    }
  end

  @doc """
  Return the associated current date.

  ## Examples

    FFNerd.Schedule.today client

  """
  def current_date(client) do
    FFNerd.get({:Today, %FFNerd.URL{service: "weather"}}, client)
  end

  @doc """
  Return the associated current week.

  ## Examples

    FFNerd.Schedule.week client

  """
  def current_week(client) do
    FFNerd.get({:Week, %FFNerd.URL{service: "weather"}}, client)
  end

  @doc """
  Return a list of all weather forecast records.

  ## Examples

    FFNerd.Schedule.list client

  """
  def list(client) do
    {:Games, %FFNerd.URL{service: "weather"}}
    |> FFNerd.get(client)
    |> Enum.map(fn{_k, v} -> new(v) end)
  end

  @doc """
  Return a single weather forecast record by game id.

  ## Examples

    FFNerd.Weather.find 2, client

  """
  def find(id, client) when is_integer(id) do
    client |> list |> Enum.find(&(&1.game_id == "#{id}"))
  end

  @doc """
  Return a single weather forecast record by team code.

  ## Examples

    FFNerd.Weather.find "SEA", client

  """
  def find(team, client) do
    client
    |> list
    |> Enum.find(fn(x) ->
         x.home_team == "#{team}" ||
         x.away_team == "#{team}"
       end)
  end
end
