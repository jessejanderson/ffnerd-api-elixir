defmodule FfnApi.Schedule do
  alias FfnApi.Game
  use HTTPoison.Base

  def list(client) do
    FfnApi.get({:Schedule, %FfnApi.Url{service: "schedule"}}, client)
    |> Enum.map(&Game.new/1)
  end

  def list(position, client) do
    FfnApi.get({:Schedule, %FfnApi.Url{service: "schedule", path1: position}}, client)
    |> Enum.map(&Game.new/1)
  end

  def current_week(client) do
    FfnApi.get({:currentWeek, %FfnApi.Url{service: "schedule"}}, client)
  end
end
