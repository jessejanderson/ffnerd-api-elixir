defmodule FFNerd.WeatherTest do
  use ExUnit.Case
  import FFNerd.Weather

  doctest FFNerd.Weather

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return the associated current date." do
    assert "2014-09-02" = current_date(@client)
  end

  test "Return the associated current week." do
    assert "1" = current_week(@client)
  end

  test "Return a list of all weather forecast records." do
    assert [%FFNerd.Weather{} | _rest] = list(@client)
  end

  test "Return a single weather forecast record by game id." do
    assert %FFNerd.Weather{game_id: "1"} = find(1, @client)
  end

  test "Return a single weather forecast record by team code." do
    assert %FFNerd.Weather{home_team: "SEA"} = find("SEA", @client)
  end

  test "Return forecast from a weather record." do
    forecast = find("SEA", @client)

    assert "GB"                = forecast.away_team
    assert ""                  = forecast.dome_img
    assert "Sunny"             = forecast.forecast
    assert "2014-09-04"        = forecast.game_date
    assert "1"                 = forecast.game_id
    assert "8:30 PM"           = forecast.game_time_et
    assert "1"                 = forecast.game_week
    assert "47.595153"         = forecast.geo_lat
    assert "-122.331625"       = forecast.geo_long
    assert "76"                = forecast.high
    assert "SEA"               = forecast.home_team
    assert "0"                 = forecast.is_dome
    assert "56"                = forecast.low
    assert "CenturyLink Field" = forecast.stadium
    assert "NBC"               = forecast.tv_station
    assert "0"                 = forecast.wind_chill
    assert "0"                 = forecast.wind_speed

    assert "http://www.fantasyfootballnerd.com/images/weather/52/32.gif"
      = forecast.large_img
    assert "http://www.fantasyfootballnerd.com/images/weather/31/32.gif"
      = forecast.medium_img
    assert "http://www.fantasyfootballnerd.com/images/weather/20/32.gif"
      = forecast.small_img
  end

end
