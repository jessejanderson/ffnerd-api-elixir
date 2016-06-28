defmodule FFNerd.DraftRankingTest do
  use ExUnit.Case
  import FFNerd.DraftRanking

  doctest FFNerd.DraftRanking

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all draft ranking records." do
    assert [%FFNerd.DraftRanking{} | _rest] = list(@client)
  end

  test "Return a list of all draft ranking records by position." do
    assert [%FFNerd.DraftRanking{position: "QB"} | _rest] = list("QB", @client)
  end

  test "Return a single draft ranking record by person id." do
    assert %FFNerd.DraftRanking{} = find(259, @client)
  end

  test "Return the avg price from an draft ranking record." do
    draft_rankings = find(259, @client)
    assert "1.826" = draft_rankings.nerd_rank
  end

  test "Return a list of all ppr draft ranking records." do
    assert [%FFNerd.DraftRanking{ppr: "1"} | _rest] = list(:ppr, @client)
  end

  test "Return a list of all ppr draft ranking records by position." do
    assert [%FFNerd.DraftRanking{position: "QB", ppr: "1"} | _rest] = list(:ppr, "QB", @client)
  end

  test "Return a single ppr draft ranking record by person id." do
    assert %FFNerd.DraftRanking{ppr: "1"} = find(:ppr, 259, @client)
  end

  test "Return the details from an draft ranking record." do
    draft_rankings = find(:ppr, 1446, @client)

    assert "6"           = draft_rankings.bye_week
    assert "Julio Jones" = draft_rankings.display_name
    assert "Julio"       = draft_rankings.fname
    assert "Jones"       = draft_rankings.lname
    assert "19.617"      = draft_rankings.nerd_rank
    assert "15"          = draft_rankings.overall_rank
    assert "1446"        = draft_rankings.player_id
    assert "WR"          = draft_rankings.position
    assert "6"           = draft_rankings.position_rank
    assert "1"           = draft_rankings.ppr
    assert "ATL"         = draft_rankings.team
  end
end
