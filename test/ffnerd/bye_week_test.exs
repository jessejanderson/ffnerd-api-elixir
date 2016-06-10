defmodule FFNerd.ByeWeekTest do
  use ExUnit.Case
  import FFNerd.ByeWeek

  doctest FFNerd.ByeWeek

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of teams for a bye week" do
    assert [%{bye_week: "4"} | _rest] = list(4, @client)
  end
end
