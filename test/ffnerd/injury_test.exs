defmodule FFNerd.InjuryTest do
  use ExUnit.Case
  import FFNerd.Injury

  doctest FFNerd.Injury

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all injuries for current week" do
    injury = list(@client)["ARI"] |> List.first
    assert %FFNerd.Injury{} = injury
  end

  test "Return all team injuries by team code." do
    assert [%FFNerd.Injury{team: "ARI"} | _rest] = list("ARI", @client)
  end

  # NOTE: Tests with specified weeks are disabled due to missing test data from FFNerd.

  # test "Return all injuries by week" do
  #   injury = list(17, @client)["ARI"] |> List.first
  #   assert %FFNerd.Injury{week: "17"} = injury
  # end

  # test "Return all team injuries by team code and week." do
  #   injuries = list("ARI", 17, @client)
  #   assert [%FFNerd.Injury{team: "ARI", week: "17"} | _rest] = injuries
  # end

  test "Return one player's injuries by player id and team code." do
    assert %FFNerd.Injury{team: "ARI", player_id: "1465"} = find(1465, "ARI", @client)
  end

  test "Return one player's injuries by player id, team code, and week." do
    assert %FFNerd.Injury{team: "ARI", player_id: "1465", week: "17"} = find(1465, "ARI", 17, @client)
  end

  test "Return injuries from a player injury record." do
    player_injuries = find(1465, "ARI", @client)

    assert "Out"                        = player_injuries.game_status
    assert "Ankle"                      = player_injuries.injury
    assert "2013-09-09"                 = player_injuries.last_update
    assert "Missed Week 1 at St. Louis" = player_injuries.notes
    assert "1465"                       = player_injuries.player_id
    assert "Rob Housler"                = player_injuries.player_name
    assert "TE"                         = player_injuries.position
    assert "Did not practice"           = player_injuries.practice_status
    assert "1"                          = player_injuries.practice_status_id
    assert "ARI"                        = player_injuries.team
    assert "1"                          = player_injuries.week
  end
end
