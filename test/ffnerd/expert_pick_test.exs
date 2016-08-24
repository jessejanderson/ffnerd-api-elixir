defmodule FFNerd.ExpertPickTest do
  use ExUnit.Case
  import FFNerd.ExpertPick

  doctest FFNerd.ExpertPick

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return all expert picks for current week by game id." do
    picks = list(49, @client)
    expert = picks |> List.first
    assert "Adam Meyer" = expert.expert_name
  end

  test "Return one expert's picks for current week by game id and expert name." do
    expert = find("Adam Meyer", 49, @client)

    assert "1"         = expert.correct
    assert "FOX Sports" = expert.expert_company
    assert "Adam Meyer" = expert.expert_name
    assert "35"         = expert.expert_season_correct
    assert "BAL"        = expert.game_pick
  end
end
