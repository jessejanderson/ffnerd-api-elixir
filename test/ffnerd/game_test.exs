defmodule FFNerd.GameTest do
  use ExUnit.Case, async: true
  import FFNerd.Game

  doctest FFNerd.Game

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of games" do
    assert [%{game_id: "1"} | _rest] = list(@client)
  end

  test "get a game by id" do
    assert %FFNerd.Game{game_id: "2"} = find(2, @client)
  end

  test "get tv station name from game" do
    game = find(2, @client)
    assert "CBS" = game.tv_station
  end
end
