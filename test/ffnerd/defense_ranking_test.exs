defmodule FFNerd.DefenseRankingTest do
  use ExUnit.Case
  import FFNerd.DefenseRanking

  doctest FFNerd.DefenseRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all defense ranking records." do
    assert [%FFNerd.DefenseRanking{} | _rest] = list(@client)
  end

  test "Return the details from a defense ranking record." do
    defense_ranking = find("SEA", @client)

    assert "173.8"            = defense_ranking.pass_yards_per_game
    assert "1"                = defense_ranking.pass_yards_per_game_rank
    assert "14.8"             = defense_ranking.points_per_game
    assert "2"                = defense_ranking.points_per_game_rank
    assert "107.5"            = defense_ranking.rush_yards_per_game
    assert "12"               = defense_ranking.rush_yards_per_game_rank
    assert "SEA"              = defense_ranking.team
    assert "Seattle Seahawks" = defense_ranking.team_name
    assert "281.3"            = defense_ranking.total_yards_per_game
    assert "1"                = defense_ranking.total_yards_per_game_rank
  end
end
