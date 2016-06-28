defmodule FFNerd.DraftProjection do
  defstruct [
    :def_fumbles_recovered,
    :def_interceptions,
    :def_return_tds,
    :def_sacks,
    :def_tds,
    :display_name,
    :extra_points,
    :fantasy_points,
    :field_goals,
    :fumbles_lost,
    :pass_attempts,
    :pass_completions,
    :pass_interceptions,
    :pass_tds,
    :pass_yards,
    :player_id,
    :receptions,
    :rec_tds,
    :rec_yards,
    :rush_attempts,
    :rush_tds,
    :rush_yards,
    :team,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Draft Projection resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#draft-projections
  """

  @doc """
  Convert raw api data to DraftProjection struct.
  """
  def new(map) do
    %FFNerd.DraftProjection{
      def_fumbles_recovered: map["fumbleRec"],
      def_interceptions:     map["interceptions"],
      def_return_tds:        map["specialTeamTD"],
      def_sacks:             map["sacks"],
      def_tds:               map["TD"],
      display_name:          map["displayName"],
      extra_points:          map["xp"],
      fantasy_points:        map["fantasyPoints"],
      field_goals:           map["fg"],
      fumbles_lost:          map["fumbles"],
      pass_attempts:         map["attempts"],
      pass_completions:      map["completions"],
      pass_interceptions:    map["passingInt"],
      pass_tds:              map["passingTD"],
      pass_yards:            map["passingYards"],
      player_id:             map["playerId"],
      receptions:            map["rec"],
      rec_tds:               map["recTD"],
      rec_yards:             map["recYards"],
      rush_attempts:         map["rushAtt"],
      rush_tds:              map["rushTD"],
      rush_yards:            map["rushYards"],
      team:                  map["team"]
    }
  end

  @doc """
  Return a list of draft projection records by position.

  ## Examples

    FFNerd.DraftProjection.list "QB", client

  """
  def list(position, client) do
    {:DraftProjections, %FFNerd.URL{service: "draft-projections", path1: position}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single draft ranking projection record by person id.

  ## Examples

    FFNerd.DraftProjection.find 259, client

  """
  def find(id, position, client) do
    list(position, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
