defmodule FFNerd.Player.StatsTest do
  use ExUnit.Case
  import FFNerd.Player.Stats

  doctest FFNerd.Player.Stats

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "find/2 can get all player stats from player id" do
    player = find(2, @client)
    assert "1" = player["2007"]["1"].interceptions
  end

  test "find/3 can get a year's player stats from player id and year" do
    player = find(2, 2007, @client)
    assert "1" = player["1"].interceptions
  end

  test "find/4 can get a game's player stats from player id, year, and week" do
    player = find(2, 2007, 1, @client)
    assert "1" = player.interceptions
  end
end
