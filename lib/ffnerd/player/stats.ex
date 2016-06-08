defmodule FFNerd.Player.Stats do
  use HTTPoison.Base
  import FFNerd.Utils

  def find(id, client) do
    FFNerd.get({:Stats, %FFNerd.Url{service: "player", path1: id}}, client)
    # |> convert_year_week_map
    # |> convert_to_atom_map
  end

  # def avg_pass_yards(%{"avgPassYards" => avg_pass_yards}), do: avg_pass_yards
  # def qb_rating(%{"QBRating" => qb_rating}), do: qb_rating
  # def sack_yards(%{"SackYards" => sack_yards}), do: sack_yards
  # def sacks(%{"Sacks" => sacks}), do: sacks
  # def completions(%{"completions" => completions}), do: completions
  # def final_score(%{"finalScore" => final_score}), do: final_score
  # def fumbles(%{"fumble" => fumbles}), do: fumbles
  # def fumbles_lost(%{"fumbleLost" => fumbles_lost}), do: fumbles_lost
  # def game_date(%{"gameDate" => game_date}), do: game_date
  # def games_played(%{"gamePlayed" => games_played}), do: games_played
  # def games_started(%{"gameStarted" => games_started}), do: games_started
  # def interceptions(%{"interceptions" => interceptions}), do: interceptions
  # def opponent(%{"opponent" => opponent}), do: opponent
  # def pass_attempts(%{"pass_attempts" => pass_attempts}), do: pass_attempts
  # def pass_tds(%{"passTD" => pass_tds}), do: pass_tds
  # def pass_yards(%{"passYards" => pass_yards}), do: pass_yards
  # def percentage(%{"percentage" => percentage}), do: percentage
  # def player_id(%{"player_id" => player_id}), do: player_id
  # def rush_attempts(%{"rush_attempts" => rush_attempts}), do: rush_attempts
  # def rush_avg(%{"rushAvg" => rush_avg}), do: rush_avg
  # def rush_tds(%{"rushTD" => rush_tds}), do: rush_tds
  # def rush_yards(%{"rushYards" => rush_yds}), do: rush_yds
  # def week(%{"week" => week}), do: week
  # def year(%{"year" => year}), do: year
end
