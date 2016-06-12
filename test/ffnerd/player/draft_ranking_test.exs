defmodule FFNerd.Player.DraftRankingTest do
  use ExUnit.Case, async: true
  import FFNerd.Player.DraftRanking

  doctest FFNerd.Player.DraftRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all draft ranking records." do
    assert [%FFNerd.Player.DraftRanking{} | _rest] = list(@client)
  end

  test "Return a list of all draft ranking records by position." do
    assert [%FFNerd.Player.DraftRanking{position: "QB"} | _rest] = list("QB", @client)
  end

  test "Return a single draft ranking record by person id." do
    assert %FFNerd.Player.DraftRanking{} = find(259, @client)
  end

  test "Return the avg price from an draft ranking record." do
    draft_rankings = find(259, @client)
    assert "1.826" = draft_rankings.nerd_rank
  end

  test "Return a list of all ppr draft ranking records." do
    assert [%FFNerd.Player.DraftRanking{ppr: "1"} | _rest] = list(:ppr, @client)
  end

  test "Return a list of all ppr draft ranking records by position." do
    assert [%FFNerd.Player.DraftRanking{position: "QB", ppr: "1"} | _rest] = list(:ppr, "QB", @client)
  end

  test "Return a single ppr draft ranking record by person id." do
    assert %FFNerd.Player.DraftRanking{ppr: "1"} = find(:ppr, 259, @client)
  end
end
