defmodule FfnApi.PlayerTest do
  use ExUnit.Case
  alias FfnApi.Player

  setup_all do
    FfnApi.start
  end

  test "Can get a list of players" do
    assert [%{"playerId" => _} | _rest] = Player.get
  end

  test "can get a single player by id" do
    assert %{"playerId" => "2"} = Player.get(2)
  end
end
