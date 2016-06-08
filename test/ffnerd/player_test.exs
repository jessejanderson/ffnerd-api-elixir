defmodule FFNerd.PlayerTest do
  use ExUnit.Case
  import FFNerd.Player

  doctest FFNerd.Player

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of players" do
    assert [%{player_id: _} | _rest] = list(@client)
  end

  test "get list of players by position" do
    assert [%{player_id: _} | _rest] = list("QB", @client)
  end

  test "get a player by id" do
    assert %{player_id: "2"} = find(2, @client)
  end

  test "display name from player" do
    player = find(2, @client)
    assert "Derek Anderson" = player.display_name
  end
end
