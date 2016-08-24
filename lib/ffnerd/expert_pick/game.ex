defmodule FFNerd.ExpertPick.Game do
  defstruct [
    :game_id,
    :away_team,
    :away_team_record,
    :consensus_count,
    :consensus_pick,
    :game_date,
    :game_time_et,
    :home_team,
    :home_team_record,
    :tv_station,
    :winner,
    :picks,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's NFLPick resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#nfl-picks
  """

  @doc """
  Convert raw api data to ExpertPick.Game struct.
  """
  def new(map, game_id) do
    %FFNerd.ExpertPick.Game{
      game_id:          game_id,
      away_team:        map["awayTeam"],
      away_team_record: map["awayTeamRecord"],
      consensus_count:  map["consensusCounts"],
      consensus_pick:   map["consensusPick"],
      game_date:        map["gameDate"],
      game_time_et:     map["gameTimeET"],
      home_team:        map["homeTeam"],
      home_team_record: map["homeTeamRecord"],
      picks:            map["picks"],
      tv_station:       map["tvStation"],
      winner:           map["winner"],
    }
  end

  @doc """
  Return a list of expert pick game records for current week.

  ## Examples

    FFNerd.ExpertPick.Game.list client

  """
  def list(client) do
    {:games, %FFNerd.URL{service: "nfl-picks"}}
    |> FFNerd.get(client)
    |> Enum.map( fn{k, v} -> new(v, k) end)
    |> Enum.map( fn(x) ->
         Map.get_and_update(x, :picks, fn(current_val) ->
           {current_val, Enum.map(current_val, &FFNerd.ExpertPick.new/1)}
         end) |> elem(1)
       end)
  end

  @doc """
  Return an expert pick game record for current week by game id.

  ## Examples

    FFNerd.ExpertPick.Game.find 49, client

  """
  def find(game_id, client) do
    list(client) |> Enum.find(&(&1.game_id == "#{game_id}"))
  end
end
