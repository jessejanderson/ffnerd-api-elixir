defmodule FFNerd.PlayerTest do
  use ExUnit.Case, async: true
  import FFNerd.Player

  doctest FFNerd.Player

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all player records." do
    assert [%FFNerd.Player{player_id: _} | _rest] = list(@client)
  end

  test "Return a list of player records by position code." do
    assert [%FFNerd.Player{position: "QB"} | _rest] = list("QB", @client)
  end

  test "Return a single player record by player id." do
    assert %FFNerd.Player{player_id: "2"} = find(2, @client)
  end

  test "display name from player" do
    player = find(2, @client)
    assert "Derek Anderson" = player.display_name
  end
end
