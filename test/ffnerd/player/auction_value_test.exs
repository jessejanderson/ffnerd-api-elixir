defmodule FFNerd.Player.AuctionValueTest do
  use ExUnit.Case, async: true
  import FFNerd.Player.AuctionValue

  doctest FFNerd.Player.AuctionValue

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all auction value records." do
    assert [%FFNerd.Player.AuctionValue{} | _rest] = list(@client)
  end

    test "Return a list of all auction value records by position." do
    assert [%FFNerd.Player.AuctionValue{position: "QB"} | _rest] = list("QB", @client)
  end

  test "Return a single auction value record by person id." do
    assert %FFNerd.Player.AuctionValue{} = find(259, @client)
  end

  test "Return the avg price from an auction value record." do
    auction_values = find(259, @client)
    assert "63" = auction_values.avg_price
  end

  # Test account does not work with PPR tests

  # test "Return a list of all ppr auction value records." do
  #   assert [%FFNerd.Player.AuctionValue{ppr: "1"} | _rest] = list(:ppr, @client)
  # end

  # test "Return a list of all ppr auction value records by position." do
  #   assert [%FFNerd.Player.AuctionValue{position: "QB", ppr: "1"} | _rest] = list(:ppr, "QB", @client)
  # end

  # test "Return a single ppr auction value record by person id." do
  #   assert %FFNerd.Player.AuctionValue{ppr: "1"} = find(:ppr, 259, @client)
  # end
end
