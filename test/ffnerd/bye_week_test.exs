defmodule FFNerd.ByeWeekTest do
  use ExUnit.Case
  import FFNerd.ByeWeek

  doctest FFNerd.ByeWeek

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of bye week records." do
    assert [%FFNerd.ByeWeek{} | _rest] = list(@client)
  end

  test "Return a list of bye week records by week number." do
    assert [%FFNerd.ByeWeek{bye_week: "4"} | _rest] = list(4, @client)
  end

  test "Return a single bye week record by team code." do
    assert %FFNerd.ByeWeek{team: "SEA"} = find("SEA", @client)
  end
end
