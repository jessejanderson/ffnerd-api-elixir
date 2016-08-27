defmodule FFNerd.PlayerTest do
  use ExUnit.Case
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

  test "Return a single player record by display name." do
    assert %FFNerd.Player{display_name: "Russell Wilson"} = find("Russell Wilson", @client)
  end

  test "Return the display name from a player record." do
    player = find(2, @client)
    assert "Derek Anderson" = player.display_name
  end

  test "Return all details from a player record." do
    player = find(2, @client)

    assert "1"              = player.active
    assert "Oregon State"   = player.college
    assert "Derek Anderson" = player.display_name
    assert "1983-06-15"     = player.dob
    assert "Derek"          = player.fname
    assert "6-6"            = player.height
    assert "3"              = player.jersey
    assert "Anderson"       = player.lname
    assert "2"              = player.player_id
    assert "QB"             = player.position
    assert "CAR"            = player.team
    assert "240"            = player.weight
  end
end
