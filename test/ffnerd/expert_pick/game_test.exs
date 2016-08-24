defmodule FFNerd.ExpertPick.GameTest do
  use ExUnit.Case
  import FFNerd.ExpertPick.Game

  doctest FFNerd.ExpertPick.Game

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all ExpertPick games for current week." do
    game = list(@client) |> List.first
    assert "2015-10-01" = game.game_date
  end

  test "Return one ExpertPick game for current week by game id." do
    game = find(49, @client)

    assert "BAL"                           = game.away_team
    assert %{ "wins" => 0, "losses" => 3 } = game.away_team_record
    assert %{ "BAL" => 24, "PIT" => 18 }   = game.consensus_count
    assert "BAL"                           = game.consensus_pick
    assert "2015-10-01"                    = game.game_date
    assert "8:25 PM"                       = game.game_time_et
    assert "PIT"                           = game.home_team
    assert %{ "wins" => 2, "losses" => 1 } = game.home_team_record
    assert "CBS"                           = game.tv_station
    assert "BAL"                           = game.winner
    assert [%FFNerd.ExpertPick{} | _]      = game.picks
    assert "49"                            = game.game_id
  end
end
