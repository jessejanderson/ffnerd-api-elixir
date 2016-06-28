defmodule FFNerd.WeeklyProjectionTest do
  use ExUnit.Case
  import FFNerd.WeeklyProjection

  doctest FFNerd.WeeklyProjection

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  # NOTE: Tests without specified week are disabled due to missing test data from FFNerd.

  # test "Return a list of all weekly projection records by position." do
  #   assert [%FFNerd.WeeklyProjection{} | _rest] = list("QB", @client)
  # end

  # test "Return a single weekly projection record by person id." do
  #   assert %FFNerd.WeeklyProjection{} = find(1847, "QB", @client)
  # end

  test "Return a list of all weekly projection records by position and week." do
    assert [%FFNerd.WeeklyProjection{} | _rest] = list("QB", 1, @client)
  end

  test "Return a single weekly projection record by person id." do
    assert %FFNerd.WeeklyProjection{} = find(1847, "QB", 1, @client)
  end

  test "Return all projections from a QB weekly projection record." do
    weekly_projections = find(14, "QB", 1, @client)

    assert "0.0"        = weekly_projections.def_fumbles_forced
    assert "0.0"        = weekly_projections.def_fumbles_recovered
    assert "0.0"        = weekly_projections.def_interceptions
    assert "0.0"        = weekly_projections.def_points_allowed
    assert "0.0"        = weekly_projections.def_return_tds
    assert "0.0"        = weekly_projections.def_sacks
    assert "0.0"        = weekly_projections.def_safeties
    assert "0.0"        = weekly_projections.def_tds
    assert "0.0"        = weekly_projections.def_yards_allowed
    assert "Drew Brees" = weekly_projections.display_name
    assert "0.0"        = weekly_projections.extra_points
    assert "0.0"        = weekly_projections.field_goals
    assert "0.0"        = weekly_projections.field_goal_attempts
    assert "0.0"        = weekly_projections.fumbles_lost
    assert "39.0"       = weekly_projections.pass_attempts
    assert "25.0"       = weekly_projections.pass_completions
    assert "1.0"        = weekly_projections.pass_interceptions
    assert "2.0"        = weekly_projections.pass_tds
    assert "317.0"      = weekly_projections.pass_yards
    assert "14"         = weekly_projections.player_id
    assert "QB"         = weekly_projections.position
    assert "0.0"        = weekly_projections.receptions
    assert "0.0"        = weekly_projections.rec_tds
    assert "0.0"        = weekly_projections.rec_yards
    assert "1.0"        = weekly_projections.rush_attempts
    assert "0.0"        = weekly_projections.rush_tds
    assert "1.0"        = weekly_projections.rush_yards
    assert "NO"         = weekly_projections.team
    assert "1"          = weekly_projections.week
  end

  test "Return all projections from a RB weekly projection record." do
    weekly_projections = find(259, "RB", 1, @client)

    assert "0.0"             = weekly_projections.def_fumbles_forced
    assert "0.0"             = weekly_projections.def_fumbles_recovered
    assert "0.0"             = weekly_projections.def_interceptions
    assert "0.0"             = weekly_projections.def_points_allowed
    assert "0.0"             = weekly_projections.def_return_tds
    assert "0.0"             = weekly_projections.def_sacks
    assert "0.0"             = weekly_projections.def_safeties
    assert "0.0"             = weekly_projections.def_tds
    assert "0.0"             = weekly_projections.def_yards_allowed
    assert "Adrian Peterson" = weekly_projections.display_name
    assert "0.0"             = weekly_projections.extra_points
    assert "0.0"             = weekly_projections.field_goals
    assert "0.0"             = weekly_projections.field_goal_attempts
    assert "0.0"             = weekly_projections.fumbles_lost
    assert "0.0"             = weekly_projections.pass_attempts
    assert "0.0"             = weekly_projections.pass_completions
    assert "0.0"             = weekly_projections.pass_interceptions
    assert "0.0"             = weekly_projections.pass_tds
    assert "0.0"             = weekly_projections.pass_yards
    assert "259"             = weekly_projections.player_id
    assert "RB"              = weekly_projections.position
    assert "3.0"             = weekly_projections.receptions
    assert "0.0"             = weekly_projections.rec_tds
    assert "24.0"            = weekly_projections.rec_yards
    assert "21.0"            = weekly_projections.rush_attempts
    assert "1.0"             = weekly_projections.rush_tds
    assert "108.0"            = weekly_projections.rush_yards
    assert "MIN"             = weekly_projections.team
    assert "1"               = weekly_projections.week
  end

  test "Return all projections from a WR weekly projection record." do
    weekly_projections = find(454, "WR", 1, @client)

    assert "0.0"            = weekly_projections.def_fumbles_forced
    assert "0.0"            = weekly_projections.def_fumbles_recovered
    assert "0.0"            = weekly_projections.def_interceptions
    assert "0.0"            = weekly_projections.def_points_allowed
    assert "0.0"            = weekly_projections.def_return_tds
    assert "0.0"            = weekly_projections.def_sacks
    assert "0.0"            = weekly_projections.def_safeties
    assert "0.0"            = weekly_projections.def_tds
    assert "0.0"            = weekly_projections.def_yards_allowed
    assert "Calvin Johnson" = weekly_projections.display_name
    assert "0.0"            = weekly_projections.extra_points
    assert "0.0"            = weekly_projections.field_goals
    assert "0.0"            = weekly_projections.field_goal_attempts
    assert "0.0"            = weekly_projections.fumbles_lost
    assert "0.0"            = weekly_projections.pass_attempts
    assert "0.0"            = weekly_projections.pass_completions
    assert "0.0"            = weekly_projections.pass_interceptions
    assert "0.0"            = weekly_projections.pass_tds
    assert "0.0"            = weekly_projections.pass_yards
    assert "454"            = weekly_projections.player_id
    assert "WR"             = weekly_projections.position
    assert "7.0"            = weekly_projections.receptions
    assert "1.0"            = weekly_projections.rec_tds
    assert "116.0"          = weekly_projections.rec_yards
    assert "0.0"            = weekly_projections.rush_attempts
    assert "0.0"            = weekly_projections.rush_tds
    assert "0.0"            = weekly_projections.rush_yards
    assert "DET"            = weekly_projections.team
    assert "1"              = weekly_projections.week
  end

  test "Return all projections from a TE weekly projection record." do
    weekly_projections = find(1187, "TE", 1, @client)

    assert "0.0"          = weekly_projections.def_fumbles_forced
    assert "0.0"          = weekly_projections.def_fumbles_recovered
    assert "0.0"          = weekly_projections.def_interceptions
    assert "0.0"          = weekly_projections.def_points_allowed
    assert "0.0"          = weekly_projections.def_return_tds
    assert "0.0"          = weekly_projections.def_sacks
    assert "0.0"          = weekly_projections.def_safeties
    assert "0.0"          = weekly_projections.def_tds
    assert "0.0"          = weekly_projections.def_yards_allowed
    assert "Jimmy Graham" = weekly_projections.display_name
    assert "0.0"          = weekly_projections.extra_points
    assert "0.0"          = weekly_projections.field_goals
    assert "0.0"          = weekly_projections.field_goal_attempts
    assert "0.0"          = weekly_projections.fumbles_lost
    assert "0.0"          = weekly_projections.pass_attempts
    assert "0.0"          = weekly_projections.pass_completions
    assert "0.0"          = weekly_projections.pass_interceptions
    assert "0.0"          = weekly_projections.pass_tds
    assert "0.0"          = weekly_projections.pass_yards
    assert "1187"         = weekly_projections.player_id
    assert "TE"           = weekly_projections.position
    assert "7.0"          = weekly_projections.receptions
    assert "1.0"          = weekly_projections.rec_tds
    assert "83.0"         = weekly_projections.rec_yards
    assert "0.0"          = weekly_projections.rush_attempts
    assert "0.0"          = weekly_projections.rush_tds
    assert "0.0"          = weekly_projections.rush_yards
    assert "NO"           = weekly_projections.team
    assert "1"            = weekly_projections.week
  end

  test "Return all projections from a K weekly projection record." do
    weekly_projections = find(752, "K", 1, @client)

    assert "0.0"                = weekly_projections.def_fumbles_forced
    assert "0.0"                = weekly_projections.def_fumbles_recovered
    assert "0.0"                = weekly_projections.def_interceptions
    assert "0.0"                = weekly_projections.def_points_allowed
    assert "0.0"                = weekly_projections.def_return_tds
    assert "0.0"                = weekly_projections.def_sacks
    assert "0.0"                = weekly_projections.def_safeties
    assert "0.0"                = weekly_projections.def_tds
    assert "0.0"                = weekly_projections.def_yards_allowed
    assert "Stephen Gostkowski" = weekly_projections.display_name
    assert "4.0"                = weekly_projections.extra_points
    assert "3.0"                = weekly_projections.field_goals
    assert "3.0"                = weekly_projections.field_goal_attempts
    assert "0.0"                = weekly_projections.fumbles_lost
    assert "0.0"                = weekly_projections.pass_attempts
    assert "0.0"                = weekly_projections.pass_completions
    assert "0.0"                = weekly_projections.pass_interceptions
    assert "0.0"                = weekly_projections.pass_tds
    assert "0.0"                = weekly_projections.pass_yards
    assert "752"                = weekly_projections.player_id
    assert "K"                  = weekly_projections.position
    assert "0.0"                = weekly_projections.receptions
    assert "0.0"                = weekly_projections.rec_tds
    assert "0.0"                = weekly_projections.rec_yards
    assert "0.0"                = weekly_projections.rush_attempts
    assert "0.0"                = weekly_projections.rush_tds
    assert "0.0"                = weekly_projections.rush_yards
    assert "NE"                 = weekly_projections.team
    assert "1"                  = weekly_projections.week
  end

  # NOTE: Test is disabled due to missing test data from FFNerd.
  # test "Return all projections from a DEF weekly projection record." do
  #   weekly_projections = find(1043, "DEF", 1, @client)
  #
  #   assert "0.0"                 = weekly_projections.def_fumbles_forced
  #   assert "0.0"                 = weekly_projections.def_fumbles_recovered
  #   assert "1.0"                 = weekly_projections.def_interceptions
  #   assert "15.0"                = weekly_projections.def_points_allowed
  #   assert "0.0"                 = weekly_projections.def_return_tds
  #   assert "3.0"                 = weekly_projections.def_sacks
  #   assert "0.0"                 = weekly_projections.def_safeties
  #   assert "0.0"                 = weekly_projections.def_tds
  #   assert "354.0"               = weekly_projections.def_yards_allowed
  #   assert "Philadelphia Eagles" = weekly_projections.display_name
  #   assert "0.0"                 = weekly_projections.extra_points
  #   assert "0.0"                 = weekly_projections.field_goals
  #   assert "0.0"                 = weekly_projections.field_goal_attempts
  #   assert "0.0"                 = weekly_projections.fumbles_lost
  #   assert "0.0"                 = weekly_projections.pass_attempts
  #   assert "0.0"                 = weekly_projections.pass_completions
  #   assert "0.0"                 = weekly_projections.pass_interceptions
  #   assert "0.0"                 = weekly_projections.pass_tds
  #   assert "0.0"                 = weekly_projections.pass_yards
  #   assert "1043"                = weekly_projections.player_id
  #   assert "DEF"                 = weekly_projections.position
  #   assert "0.0"                 = weekly_projections.receptions
  #   assert "0.0"                 = weekly_projections.rec_tds
  #   assert "0.0"                 = weekly_projections.rec_yards
  #   assert "0.0"                 = weekly_projections.rush_attempts
  #   assert "0.0"                 = weekly_projections.rush_tds
  #   assert "0.0"                 = weekly_projections.rush_yards
  #   assert "PHI"                 = weekly_projections.team
  #   assert "1"                   = weekly_projections.week
  # end
end
