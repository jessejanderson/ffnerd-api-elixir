defmodule FFNerd.Player.Stats do
  defstruct [
    :final_score,
    :fumbles,
    :fumbles_lost,
    :game_date,
    :game_played,
    :game_started,
    :interceptions,
    :opponent,
    :pass_attempts,
    :pass_completions,
    :pass_percentage,
    :pass_tds,
    :pass_yards,
    :pass_yards_average,
    :player_id,
    :qb_rating,
    :receptions,
    :rec_tds,
    :rec_yards,
    :rec_yards_average,
    :rec_yards_longest,
    :rush_attempts,
    :rush_tds,
    :rush_yards,
    :rush_yards_average,
    :rush_yards_longest,
    :sack_yards,
    :sacks,
    :week,
    :year,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Player Stats resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#player
  """

  @doc """
  Convert raw api data to Player.Stats struct.
  """
  def new(map) do
    %FFNerd.Player.Stats{
      final_score:        map["finalScore"],
      fumbles:            map["fumble"],
      fumbles_lost:       map["fumbleLost"],
      game_date:          map["gameDate"],
      game_played:        map["gamePlayed"],
      game_started:       map["gameStarted"],
      interceptions:      map["interceptions"],
      opponent:           map["opponent"],
      pass_attempts:      map["passAttempts"],
      pass_completions:   map["completions"],
      pass_percentage:    map["percentage"],
      pass_tds:           map["passTD"],
      pass_yards:         map["passYards"],
      pass_yards_average: map["avgPassYards"],
      player_id:          map["playerId"],
      qb_rating:          map["QBRating"],
      receptions:         map["receptions"],
      rec_tds:            map["recTD"],
      rec_yards:          map["recYards"],
      rec_yards_average:  map["recAvg"],
      rush_attempts:      map["rushAttempts"],
      rush_tds:           map["rushTD"],
      rush_yards:         map["rushYards"],
      rush_yards_average: map["rushAvg"],
      rush_yards_longest: map["longRun"],
      sack_yards:         map["SackYards"],
      sacks:              map["Sacks"],
      week:               map["week"],
      year:               map["year"],
    }
  end

  @doc """
  Return player stats record by id or FFNerd.Player struct.

  ## Examples

    FFNerd.Player.Stats.find 2, client

  """
  def find(%{player_id: id}, client) do
    find(id, client)
  end

  def find(id, client) do
    {:Stats, %FFNerd.URL{service: "player", path1: id}}
    |> FFNerd.get(client)
    |> Enum.map(fn{k, v} ->
         {k, Enum.map(v, fn{k2, v2} ->
           {k2, new(v2)}
         end) |> Enum.into(%{})}
       end)
    |> Enum.into(%{})
  end

  @doc """
  Return player stats record by id and year.

  ## Examples

    FFNerd.Player.Stats.find 2, 2009, client

  """
  def find(id, year, client) do
    {:Stats, %FFNerd.URL{service: "player", path1: id}}
    |> FFNerd.get(client)
    |> Map.get("#{year}")
    |> Enum.map(fn{k, v} -> {k, new(v)} end)
    |> Enum.into(%{})
  end

  @doc """
  Return player stats record by id, year, and week.

  ## Examples

    FFNerd.Player.Stats.find 2, 2009, 17, client

  """
  def find(id, year, week, client) do
    {:Stats, %FFNerd.URL{service: "player", path1: id}}
    |> FFNerd.get(client)
    |> Map.get("#{year}")
    |> Map.get("#{week}")
    |> new
  end
end
