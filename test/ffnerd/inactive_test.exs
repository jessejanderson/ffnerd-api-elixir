defmodule FFNerd.InactiveTest do
  use ExUnit.Case
  import FFNerd.Inactive

  doctest FFNerd.Inactive

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all inactives for current week" do
    inactives = list(@client) |> List.first
    assert %FFNerd.Inactive{display_name: "Andre Brown"} = inactives
  end

  test "Return all inactives by week" do
    inactives = list(17, @client) |> List.first
    assert %FFNerd.Inactive{display_name: "Adrian Peterson", week: "17"} = inactives
  end

  test "Return one inactive record by player id." do
    inactive = find(1465, @client)

    assert "Rob Housler" = inactive.display_name
    assert "1465"        = inactive.player_id
    assert "TE"          = inactive.position
    assert "ARI"         = inactive.team
    assert "1"           = inactive.week
    assert "2013"        = inactive.year
  end

  test "Return one inactive record by player id and week" do
    inactive = find(259, 17, @client)
    assert %FFNerd.Inactive{display_name: "Adrian Peterson", week: "17"} = inactive
  end
end
