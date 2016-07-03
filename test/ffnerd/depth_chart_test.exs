defmodule FFNerd.DepthChartTest do
  use ExUnit.Case
  import FFNerd.DepthChart
  alias FFNerd.DepthChart
  alias FFNerd.DepthChart.Player

  doctest FFNerd.DepthChart

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all depth charts" do
    depth_charts = list(@client)
    assert %{"SEA" => %DepthChart{qb: [%Player{player_name: "Russell Wilson"} | _]}} = depth_charts
  end

  test "Return one team's depth chart by team code" do
    team = find("SEA", @client)
    assert %DepthChart{qb: [%Player{player_name: "Russell Wilson"} | _]} = team
  end

  test "Return one team's position depth chart by team code and position" do
    team_qbs = find("SEA", "QB", @client)
    assert [%Player{player_name: "Russell Wilson"} | _] = team_qbs
  end

  test "Return depth chart player by team code, position, and depth" do
    player = find("SEA", "WR1", 1, @client)
    assert %Player{player_name: "Doug Baldwin"} = player

    assert "1"            = player.depth
    assert "1549"         = player.player_id
    assert "Doug Baldwin" = player.player_name
    assert "WR1"          = player.position
    assert "SEA"          = player.team
  end
end
