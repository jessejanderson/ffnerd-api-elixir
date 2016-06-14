defmodule FFNerd.Player.DraftProjectionTest do
  use ExUnit.Case, async: true
  import FFNerd.Player.DraftProjection

  doctest FFNerd.Player.DraftProjection

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all draft ranking records by position." do
    assert [%FFNerd.Player.DraftProjection{} | _rest] = list("QB", @client)
  end

  test "Return a single draft ranking record by person id." do
    assert %FFNerd.Player.DraftProjection{} = find(1847, "QB", @client)
  end

  test "Return the avg price from a draft ranking record." do
    draft_projections = find(1847, "QB", @client)
    assert "265" = draft_projections.fantasy_points
  end
end
