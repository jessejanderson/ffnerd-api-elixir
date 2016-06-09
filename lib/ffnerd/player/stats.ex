defmodule FFNerd.Player.Stats do
  defstruct avg_pass_yards: nil,
            completions: nil,
            final_score: nil,
            fumble: nil,
            fumble_lost: nil,
            game_date: nil,
            game_played: nil,
            game_started: nil,
            interceptions: nil,
            opponent: nil,
            pass_attempts: nil,
            pass_td: nil,
            pass_yards: nil,
            percentage: nil,
            player_id: nil,
            qb_rating: nil,
            rush_attempts: nil,
            rush_avg: nil,
            rush_td: nil,
            rush_yards: nil,
            sacks: nil,
            sack_yards: nil,
            week: nil,
            year: nil
  use ExConstructor
  use HTTPoison.Base

  def find(id, client) do
    FFNerd.get({:Stats, %FFNerd.Url{service: "player", path1: id}}, client)
    |> Enum.map(fn{k, v} ->
         {k, Enum.map(v, fn{k2, v2} ->
           {k2, new(v2)}
         end) |> Enum.into(%{})} 
       end)
    |> Enum.into(%{})
  end

  def find(id, year, client) do
    FFNerd.get({:Stats, %FFNerd.Url{service: "player", path1: id}}, client)
    |> Map.get("#{year}")
    |> Enum.map(fn{k, v} -> {k, new(v)} end)
    |> Enum.into(%{})
  end

  def find(id, year, week, client) do
    FFNerd.get({:Stats, %FFNerd.Url{service: "player", path1: id}}, client)
    |> Map.get("#{year}")
    |> Map.get("#{week}")
    |> new
  end
end
