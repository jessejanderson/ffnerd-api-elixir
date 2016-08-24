defmodule FFNerd.ExpertPick do
  defstruct [:correct, :expert_company, :expert_name, :game_pick, :expert_season_correct]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's NFLPick resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#nfl-picks
  """

  @doc """
  Return a list of expert pick records by game id.

  ## Examples

    FFNerd.ExpertPick.list 49, client

  """
  def list(game_id, client) do
    {:games, %FFNerd.URL{service: "nfl-picks"}}
    |> FFNerd.get(client)
    |> Map.get("#{game_id}")
    |> Map.get("picks")
    |> Enum.map(&new/1)
  end

  @doc """
  Return an expert pick record for current week by game id and expert name.

  ## Examples

    FFNerd.ExpertPick.find "Adam Meyer", 49, client

  """
  def find(name, game_id, client) do
    list(game_id, client) |> Enum.find(&(&1.expert_name == "#{name}"))
  end
end
