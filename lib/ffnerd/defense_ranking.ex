defmodule FFNerd.DefenseRanking do
  defstruct [
    :pass_yards_per_game,
    :pass_yards_per_game_rank,
    :points_per_game,
    :points_per_game_rank,
    :rush_yards_per_game,
    :rush_yards_per_game_rank,
    :team,
    :team_name,
    :total_yards_per_game,
    :total_yards_per_game_rank,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Defense Ranking resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#defense-rankings
  """

  @doc """
  Convert raw api data to Player.DefenseRanking struct.
  """
  def new(map) do
    %FFNerd.DefenseRanking{
      pass_yards_per_game:       map["passingYardsPerGame"],
      pass_yards_per_game_rank:  map["pypgRank"],
      points_per_game:           map["pointsPerGame"],
      points_per_game_rank:      map["ppgRank"],
      rush_yards_per_game:       map["rushingYardsPerGame"],
      rush_yards_per_game_rank:  map["rypgRank"],
      team:                      map["team"],
      team_name:                 map["teamName"],
      total_yards_per_game:      map["yardsPerGame"],
      total_yards_per_game_rank: map["ypgRank"],
    }
  end

  @doc """
  Return a list of defense ranking records.

  ## Examples

    FFNerd.DefenseRanking.list client

  """
  def list(client) do
    {:DefenseRankings, %FFNerd.URL{service: "defense-rankings"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a defense ranking record by team code.

  ## Examples

    FFNerd.DefenseRanking.find "SEA", client

  """
  def find(team, client) do
    list(client) |> Enum.find(&(&1.team == "#{team}"))
  end
end
