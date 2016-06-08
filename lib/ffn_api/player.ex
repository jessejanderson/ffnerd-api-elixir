defmodule FfnApi.Player do
  use HTTPoison.Base
  import FfnApi.Utils

  def list(client) do
    FfnApi.get({:Players, %FfnApi.Url{service: "players"}}, client)
    |> Enum.map(&convert_to_atom_map/1)
  end

  def list(position, client) do
    FfnApi.get({:Players, %FfnApi.Url{service: "players", path1: position}}, client)
    |> Enum.map(&convert_to_atom_map/1)
  end

  def find(id, client) do
    FfnApi.get({:Player, %FfnApi.Url{service: "player", path1: id}}, client)
    |> convert_to_atom_map
  end

end
