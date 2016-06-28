defmodule FFNerd.WeeklyIDPRankingTest do
  use ExUnit.Case
  import FFNerd.WeeklyIDPRanking

  doctest FFNerd.WeeklyIDPRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all weekly idp ranking records." do
    assert [%FFNerd.WeeklyIDPRanking{} | _rest] = list(@client)
  end

  test "Return a list of all weekly idp ranking records by position." do
    assert [%FFNerd.WeeklyIDPRanking{position: "DE"} | _rest] = list("DE", @client)
  end

  test "Return all details from a QB weekly projection record." do
    def_ranking = list("DE", @client) |> List.first

    assert "J.J. Watt" = def_ranking.player
    assert "DE" = def_ranking.position
    assert "1" = def_ranking.rank
    assert "HOU" = def_ranking.team
  end
end
