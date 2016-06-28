defmodule FFNerd.ScheduleTest do
  use ExUnit.Case
  import FFNerd.Schedule

  doctest FFNerd.Schedule

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return the associated current week." do
    assert 17 = current_week(@client)
  end

  test "Return a list of all game records." do
    assert [%FFNerd.Game{} | _rest] = list(@client)
  end

  test "Return a list of game records by team code." do
    assert [%FFNerd.Game{away_team: "SEA"} | _rest] = list("SEA", @client)
  end

  test "Return a single game record by game id." do
    assert %FFNerd.Game{game_id: "1"} = find(1, @client)
  end
end
