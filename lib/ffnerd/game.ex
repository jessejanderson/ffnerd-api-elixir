defmodule FFNerd.Game do
  defstruct game_id: nil,
            game_week: nil,
            game_date: nil,
            away_team: nil,
            home_team: nil,
            game_time_et: nil,
            tv_station: nil
  use ExConstructor
  use HTTPoison.Base

  def list(client), do: FFNerd.Schedule.list(client)

  def find(id, client) do
    FFNerd.get({:Schedule, %FFNerd.Url{service: "schedule"}}, client)
    |> Enum.filter(fn(%{"gameId" => game_id}) -> game_id == "#{id}" end)
    |> hd
    |> new
  end
end
