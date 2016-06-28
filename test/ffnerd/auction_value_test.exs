defmodule FFNerd.AuctionValueTest do
  use ExUnit.Case
  import FFNerd.AuctionValue

  doctest FFNerd.AuctionValue

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all auction value records." do
    assert [%FFNerd.AuctionValue{} | _rest] = list(@client)
  end

  test "Return a list of all auction value records by position." do
    assert [%FFNerd.AuctionValue{position: "QB"} | _rest] = list("QB", @client)
  end

  test "Return a single auction value record by person id." do
    assert %FFNerd.AuctionValue{} = find(230, @client)
  end

  test "Return all details from an auction value record." do
    player = find(230, @client)

    assert "57"             = player.avg_price
    assert "Marshawn Lynch" = player.display_name
    assert "58"             = player.max_price
    assert "56"             = player.min_price
    assert "230"            = player.player_id
    assert "RB"             = player.position
    assert "0"              = player.ppr
    assert "SEA"            = player.team
  end

  # Test account does not work with PPR tests

  # test "Return a list of all ppr auction value records." do
  #   assert [%FFNerd.AuctionValue{ppr: "1"} | _rest] = list(:ppr, @client)
  # end

  # test "Return a list of all ppr auction value records by position." do
  #   assert [%FFNerd.AuctionValue{position: "QB", ppr: "1"} | _rest] = list(:ppr, "QB", @client)
  # end

  # test "Return a single ppr auction value record by person id." do
  #   assert %FFNerd.AuctionValue{ppr: "1"} = find(:ppr, 259, @client)
  # end
end
