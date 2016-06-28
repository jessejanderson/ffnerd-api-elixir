defmodule FFNerd.DraftProjectionTest do
  use ExUnit.Case
  import FFNerd.DraftProjection

  doctest FFNerd.DraftProjection

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all draft projection records by position." do
    assert [%FFNerd.DraftProjection{} | _rest] = list("QB", @client)
  end

  test "Return a single draft projection record by person id." do
    assert %FFNerd.DraftProjection{} = find(1847, "QB", @client)
  end

  test "Return all projections from a QB draft projection record." do
    draft_projections = find(14, "QB", @client)

    assert "Drew Brees" = draft_projections.display_name
    assert "335"        = draft_projections.fantasy_points
    assert "640"        = draft_projections.pass_attempts
    assert "422"        = draft_projections.pass_completions
    assert "17"         = draft_projections.pass_interceptions
    assert "40"         = draft_projections.pass_tds
    assert "4992"       = draft_projections.pass_yards
    assert "14"         = draft_projections.player_id
    assert "1"          = draft_projections.rush_tds
    assert "28"         = draft_projections.rush_yards
    assert "NO"         = draft_projections.team
  end

  test "Return all projections from a RB draft projection record." do
    draft_projections = find(259, "RB", @client)

    assert "Adrian Peterson" = draft_projections.display_name
    assert "273"             = draft_projections.fantasy_points
    assert "259"             = draft_projections.player_id
    assert "39"              = draft_projections.receptions
    assert "1"               = draft_projections.rec_tds
    assert "318"             = draft_projections.rec_yards
    assert "342"             = draft_projections.rush_attempts
    assert "12"              = draft_projections.rush_tds
    assert "1674"            = draft_projections.rush_yards
    assert "MIN"             = draft_projections.team
  end

  test "Return all projections from a WR draft projection record." do
    draft_projections = find(454, "WR", @client)

    assert "Calvin Johnson" = draft_projections.display_name
    assert "212"            = draft_projections.fantasy_points
    assert "454"            = draft_projections.player_id
    assert "98"             = draft_projections.receptions
    assert "11"             = draft_projections.rec_tds
    assert "1461"           = draft_projections.rec_yards
    assert "0"              = draft_projections.rush_attempts
    assert "0"              = draft_projections.rush_tds
    assert "0"              = draft_projections.rush_yards
    assert "DET"            = draft_projections.team
  end

  test "Return all projections from a TE draft projection record." do
    draft_projections = find(1187, "TE", @client)

    assert "Jimmy Graham" = draft_projections.display_name
    assert "172"          = draft_projections.fantasy_points
    assert "1187"         = draft_projections.player_id
    assert "91"           = draft_projections.receptions
    assert "10"           = draft_projections.rec_tds
    assert "1122"         = draft_projections.rec_yards
    assert "0"            = draft_projections.rush_attempts
    assert "0"            = draft_projections.rush_tds
    assert "0"            = draft_projections.rush_yards
    assert "NO"           = draft_projections.team
  end

  test "Return all projections from a K draft projection record." do
    draft_projections = find(743, "K", @client)

    assert "Matt Bryant" = draft_projections.display_name
    assert "134"         = draft_projections.fantasy_points
    assert "47"          = draft_projections.extra_points
    assert "29"          = draft_projections.field_goals
    assert "743"         = draft_projections.player_id
    assert "ATL"         = draft_projections.team
  end

  test "Return all projections from a DEF draft projection record." do
    draft_projections = find(1063, "DEF", @client)

    assert "14"             = draft_projections.def_fumbles_recovered
    assert "142"            = draft_projections.fantasy_points
    assert "21"             = draft_projections.def_interceptions
    assert "1"              = draft_projections.def_return_tds
    assert "48"             = draft_projections.def_sacks
    assert "Houston Texans" = draft_projections.display_name
    assert "1063"           = draft_projections.player_id
    assert "HOU"            = draft_projections.team
  end
end
