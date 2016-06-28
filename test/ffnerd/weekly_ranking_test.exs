defmodule FFNerd.WeeklyRankingTest do
  use ExUnit.Case
  # import FFNerd.WeeklyRanking

  doctest FFNerd.WeeklyRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  # NOTE: Tests are disabled due to missing test data from FFNerd.

  # test "Return a list of all weekly ranking records by position." do
  #   assert [%FFNerd.WeeklyRanking{position: "QB"} | _rest] = list("QB", @client)
  # end

  # test "Return a list of all weekly ranking records by position and week." do
  #   assert [%FFNerd.WeeklyRanking{position: "QB", week: "17"} | _rest] = list("QB", 17, @client)
  # end

  # test "Return a single weekly ranking record by person id." do
  #   assert %FFNerd.WeeklyRanking{} = find(14, "QB", @client)
  # end

  # test "Return the details from an weekly ranking record." do
  #   weekly_rankings = find(1446, "WR", @client)
  #
  #   assert "Questionable" = weekly_rankings.game_status
  #   assert "Knee"         = weekly_rankings.injury
  #   assert "2013-09-16"   = weekly_rankings.last_update
  #   assert "Julio Jones"  = weekly_rankings.name
  #   assert "1446"         = weekly_rankings.player_id
  #   assert "WR"           = weekly_rankings.position
  #   assert "19.60"        = weekly_rankings.ppr
  #   assert "23.30"        = weekly_rankings.ppr_high
  #   assert "16.00"        = weekly_rankings.ppr_low
  #   assert "14.00"        = weekly_rankings.standard
  #   assert "17.30"        = weekly_rankings.standard_high
  #   assert "9.00"         = weekly_rankings.standard_low
  #   assert "ATL"          = weekly_rankings.team
  #   assert "2"            = weekly_rankings.week
  #
  #   assert "Limited Participation in Practice"
  #     = weekly_rankings.practice_status
  # end
end
