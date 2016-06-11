defmodule FFNerd.WeatherTest do
  use ExUnit.Case, async: true
  import FFNerd.Weather

  doctest FFNerd.Weather

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return the associated current date." do
    assert "2014-09-02" = today(@client)
  end

  test "Return the associated current week." do
    assert "1" = week(@client)
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
end
