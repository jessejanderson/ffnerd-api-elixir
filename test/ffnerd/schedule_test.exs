defmodule FFNerd.ScheduleTest do
  use ExUnit.Case
  import FFNerd.Schedule

  doctest FFNerd.Schedule

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "get list of games" do
    assert [%{game_id: "1"} | _rest] = list(@client)
  end

  test "get the current week" do
    assert 17 = current_week(@client)
  end
end
