defmodule FFNerd.TeamTest do
  use ExUnit.Case
  import FFNerd.Team

  doctest FFNerd.Team

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all team records." do
    assert [%{code: "ARI"} | _rest] = list(@client)
  end

  test "Return a single team record by team code." do
    assert %FFNerd.Team{code: "SEA"} = find("SEA", @client)
  end
end
