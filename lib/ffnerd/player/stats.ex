defmodule FFNerd.Player.Stats do
  defstruct [:avg_pass_yards, :completions, :final_score, :fumble, :fumble_lost, :game_date, :game_played, :game_started, :interceptions, :opponent, :pass_attempts, :pass_td, :pass_yards, :percentage, :player_id, :qb_rating, :rush_attempts, :rush_avg, :rush_td, :rush_yards, :sacks, :sack_yards, :week, :year]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Player Stats resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#player
  """

  @doc """
  Find player stats by id

  ## Examples

    FFNerd.Player.Stats.find 2, client

  """
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
  Find player stats by id and year

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
  Find player stats by id, year, and week

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
