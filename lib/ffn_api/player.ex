defmodule FfnApi.Player do
  use HTTPoison.Base

  def get do
    get {:Players, %FfnApi.Url{service: "players"}}
  end

  def get({atom, %FfnApi.Url{} = url_struct}) do
    json = url_struct |> FfnApi.build_url |> FfnApi.get!
    json.body[atom]
  end

  def get(id) do
    get {:Player, %FfnApi.Url{service: "player", param1: id}}
  end

end
