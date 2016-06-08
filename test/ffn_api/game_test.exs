defmodule FfnApi.GameTest do
  use ExUnit.Case
  import FfnApi.Game

  doctest FfnApi.Game

  @client FfnApi.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of games" do
    assert [%{game_id: "1"} | _rest] = list(@client)
  end

  test "get a game by id" do
    assert %FfnApi.Game{game_id: "2"} = find(2, @client)
  end

  test "get tv station name from game" do
    game = find(2, @client)
    assert "CBS" = game.tv_station
  end
end
