defmodule FFNerd.Player do
  defstruct player_id: nil,
            star: nil,
            active: nil,
            jersey: nil,
            fname: nil,
            lname: nil,
            display_name: nil,
            team: nil,
            position: nil,
            height: nil,
            weight: nil,
            dob: nil,
            college: nil,
            twitter_id: nil
  use ExConstructor
  use HTTPoison.Base

  def list(client) do
    FFNerd.get({:Players, %FFNerd.Url{service: "players"}}, client)
    |> Enum.map(&new/1)
  end

  def list(position, client) do
    FFNerd.get({:Players, %FFNerd.Url{service: "players", path1: position}}, client)
    |> Enum.map(&new/1)
  end

  def find(id, client) do
    FFNerd.get({:Player, %FFNerd.Url{service: "player", path1: id}}, client)
    |> new
  end
end
