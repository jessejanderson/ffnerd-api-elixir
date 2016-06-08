defmodule FFNerd.Player.StatsTest do
  use ExUnit.Case
  import FFNerd.Player.Stats

  doctest FFNerd.Player.Stats

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  # test "get a player's stats by id" do
  #   assert %{qb_rating: "2"} = find(2, @client)
  # end
  #
  # test "get interceptions from player stats, year, and game id" do
  #   player = find(2, @client)
  #   assert "1" = player["2007"]["1"].interceptions
  # end

  # test "can get list of players" do
  #   assert [%{player_id: _} | _rest] = list(@client)
  # end

  # test "can get list of players by position" do
  #   assert [%{player_id: _} | _rest] = list("QB", @client)
  # end

  # test "can get a players stats by id" do
  #   assert %{qb_rating: _} = find(2, @client)["2012"]["9"]
  # end

  # test "get display name from player" do
  #   player = find(2, @client)
  #   assert "Derek Anderson" = player.display_name
  # end
end
