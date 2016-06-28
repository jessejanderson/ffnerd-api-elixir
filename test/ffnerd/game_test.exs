defmodule FFNerd.GameTest do
  use ExUnit.Case
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

  test "Return all details from a game record." do
    game = find(2, @client)

    assert "NE"         = game.away_team
    assert "2013-09-08" = game.game_date
    assert "2"          = game.game_id
    assert "1:00 PM"    = game.game_time_et
    assert "1"          = game.game_week
    assert "BUF"        = game.home_team
    assert "CBS"        = game.tv_station
  end
end
