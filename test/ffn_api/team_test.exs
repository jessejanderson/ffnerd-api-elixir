defmodule FfnApi.TeamTest do
  use ExUnit.Case
  import FfnApi.Team

  doctest FfnApi.Team

  @client FfnApi.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of teams" do
    assert [%{code: "ARI"} | _rest] = list(@client)
  end
end
