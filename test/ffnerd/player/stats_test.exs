defmodule FFNerd.Player.StatsTest do
  use ExUnit.Case
  import FFNerd.Player.Stats

  doctest FFNerd.Player.Stats

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all player stats by %FFNerd.Player{} with player id." do
    player = find(%FFNerd.Player{player_id: 2}, @client)
    assert "1" = player["2007"]["1"].interceptions
  end

  test "Return all player stats by player id." do
    player = find(2, @client)
    assert "1" = player["2007"]["1"].interceptions
  end

  test "Return one year's player stats by player id and year." do
    player = find(2, 2007, @client)
    assert "1" = player["1"].interceptions
  end

  test "Return one week's player stats by player id, year, and week." do
    player = find(2, 2007, 1, @client)
    assert "1" = player.interceptions
  end

  test "Return stats from a single week QB stats record." do
    player_stats = find(14, 2013, 1, @client)

    assert "W23-17" = player_stats.final_score
    assert "0"      = player_stats.fumbles
    assert "0"      = player_stats.fumbles_lost
    assert "09/08"  = player_stats.game_date
    assert "1"      = player_stats.game_played
    assert "1"      = player_stats.game_started
    assert "1"      = player_stats.interceptions
    assert "ATL"    = player_stats.opponent
    assert "35"     = player_stats.pass_attempts
    assert "26"     = player_stats.pass_completions
    assert "74.30"  = player_stats.pass_percentage
    assert "2"      = player_stats.pass_tds
    assert "357"    = player_stats.pass_yards
    assert "10.20"  = player_stats.pass_yards_average
    assert "14"     = player_stats.player_id
    assert "113.60" = player_stats.qb_rating
    assert "3"      = player_stats.rush_attempts
    assert "0"      = player_stats.rush_tds
    assert "2"      = player_stats.rush_yards
    assert "0.70"   = player_stats.rush_yards_average
    assert "16"     = player_stats.sack_yards
    assert "2"      = player_stats.sacks
    assert "1"      = player_stats.week
    assert "2013"   = player_stats.year
  end

  test "Return stats from a single week WR stats record." do
    player_stats = find(1549, 2013, 1, @client)

    assert "W12-7" = player_stats.final_score
    assert "0"     = player_stats.fumbles
    assert "0"     = player_stats.fumbles_lost
    assert "09/08" = player_stats.game_date
    assert "1"     = player_stats.game_played
    assert "0"     = player_stats.game_started
    assert "@CAR"  = player_stats.opponent
    assert "1549"  = player_stats.player_id
    assert "0"     = player_stats.rec_tds
    assert "91"    = player_stats.rec_yards
    assert "13.00" = player_stats.rec_yards_average
    assert "7"     = player_stats.receptions
    assert "1"     = player_stats.rush_attempts
    assert "0"     = player_stats.rush_tds
    assert "3"     = player_stats.rush_yards
    assert "3.00"  = player_stats.rush_yards_average
    assert "3"     = player_stats.rush_yards_longest
    assert "1"     = player_stats.week
    assert "2013"  = player_stats.year
  end

end
