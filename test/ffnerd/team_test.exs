defmodule FFNerd.TeamTest do
  use ExUnit.Case
  import FFNerd.Team

  doctest FFNerd.Team

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of teams" do
    assert [%{code: "ARI"} | _rest] = list(@client)
  end
end
