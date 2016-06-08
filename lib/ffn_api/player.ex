defmodule FfnApi.Player do
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
    FfnApi.get({:Players, %FfnApi.Url{service: "players"}}, client)
    |> Enum.map(&new/1)
  end

  def list(position, client) do
    FfnApi.get({:Players, %FfnApi.Url{service: "players", path1: position}}, client)
    |> Enum.map(&new/1)
  end

  def find(id, client) do
    FfnApi.get({:Player, %FfnApi.Url{service: "player", path1: id}}, client)
    |> new
  end
end
