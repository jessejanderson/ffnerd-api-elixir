defmodule FFNerd.Player.WeeklyRankingTest do
  use ExUnit.Case, async: true
  import FFNerd.Player.WeeklyRanking

  doctest FFNerd.Player.WeeklyRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  # NOTE: Tests are disabled due to missing test data from FFNerd.

  # test "Return a list of all weekly ranking records by position." do
  #   assert [%FFNerd.Player.WeeklyRanking{position: "QB"} | _rest] = list("QB", @client)
  # end

  # test "Return a list of all weekly ranking records by position and week." do
  #   assert [%FFNerd.Player.WeeklyRanking{position: "QB", week: "17"} | _rest] = list("QB", 17, @client)
  # end

  # test "Return a single weekly ranking record by person id." do
  #   assert %FFNerd.Player.WeeklyRanking{} = find(14, "QB", @client)
  # end

  # test "Return the standard high ranking from an weekly ranking record." do
  #   weekly_rankings = find(14, "QB", @client)
  #   assert "32.00" = weekly_rankings.standard_high
  # end
end
