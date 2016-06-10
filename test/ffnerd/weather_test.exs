defmodule FFNerd.WeatherTest do
  use ExUnit.Case
  import FFNerd.Weather

  doctest FFNerd.Weather

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get a list of current week's weather forecasts" do
    assert %{forecast: "Sunny"} = list(@client)["SEA"]
  end

  test "get a weather forecast by game id" do
    assert %{forecast: "Sunny"} = find(1, @client)
  end

  test "get a weather forecast by home team short name" do
    assert %{forecast: "Sunny"} = find("SEA", @client)
  end

  test "get the current week" do
    assert "1" = week(@client)
  end

  test "get the current date" do
    assert "2014-09-02" = today(@client)
  end
end
