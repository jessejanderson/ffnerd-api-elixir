defmodule FFNerd.WeeklyProjection do
  defstruct [
    :def_fumbles_forced,
    :def_fumbles_recovered,
    :def_interceptions,
    :def_points_allowed,
    :def_return_tds,
    :def_sacks,
    :def_safeties,
    :def_tds,
    :def_yards_allowed,
    :display_name,
    :extra_points,
    :field_goals,
    :field_goal_attempts,
    :fumbles_lost,
    :pass_attempts,
    :pass_completions,
    :pass_interceptions,
    :pass_tds,
    :pass_yards,
    :player_id,
    :position,
    :rec_tds,
    :rec_yards,
    :receptions,
    :rush_attempts,
    :rush_tds,
    :rush_yards,
    :team,
    :week,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's WeeklyProjection resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weekly-projections
  """

  @doc """
  Convert raw api data to WeeklyProjection struct.
  """
  def new(map) do
    %FFNerd.WeeklyProjection{
      def_fumbles_forced:    map["defFF"],
      def_fumbles_recovered: map["defFR"],
      def_interceptions:     map["defInt"],
      def_points_allowed:    map["defPA"],
      def_return_tds:        map["defRetTD"],
      def_sacks:             map["defSack"],
      def_safeties:          map["defSafety"],
      def_tds:               map["defTD"],
      def_yards_allowed:     map["defYdsAllowed"],
      display_name:          map["displayName"],
      extra_points:          map["xp"],
      field_goals:           map["fg"],
      field_goal_attempts:   map["fgAtt"],
      fumbles_lost:          map["fumblesLost"],
      pass_attempts:         map["passAtt"],
      pass_completions:      map["passCmp"],
      pass_interceptions:    map["passInt"],
      pass_tds:              map["passTD"],
      pass_yards:            map["passYds"],
      player_id:             map["playerId"],
      position:              map["position"],
      rec_tds:               map["recTD"],
      rec_yards:             map["recYds"],
      receptions:            map["receptions"],
      rush_attempts:         map["rushAtt"],
      rush_tds:              map["rushTD"],
      rush_yards:            map["rushYds"],
      team:                  map["team"],
      week:                  map["week"]
    }
  end

  @doc """
  Return a list of weekly projection records by position.

  ## Examples

    FFNerd.WeeklyProjection.list "QB", client

    FFNerd.WeeklyProjection.list :ppr, "QB", client

  """
  def list(position, client) do
    {:Projections, %FFNerd.URL{service: "weekly-projections", path1: position}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of weekly projection records by position and week.

  ## Examples

    FFNerd.WeeklyProjection.list "QB", client

    FFNerd.WeeklyProjection.list :ppr, "QB", client

  """
  def list(position, week, client) do
    {:Projections, %FFNerd.URL{service: "weekly-projections", path1: position, path2: week}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single weekly ranking projection by person id and position.

  ## Examples

    FFNerd.WeeklyProjection.find 259, client

    FFNerd.WeeklyProjection.find :ppr, 259, client

  """
  def find(id, position, client) do
    list(position, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  @doc """
  Return a single weekly ranking projection by person id, position, and week.

  ## Examples

    FFNerd.WeeklyProjection.find 259, client

    FFNerd.WeeklyProjection.find :ppr, 259, client

  """
  def find(id, position, week, client) do
    list(position, week, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
