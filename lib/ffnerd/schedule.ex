defmodule FFNerd.Schedule do
  alias FFNerd.Game
  use HTTPoison.Base

  def list(client) do
    FFNerd.get({:Schedule, %FFNerd.Url{service: "schedule"}}, client)
    |> Enum.map(&Game.new/1)
  end

  def list(position, client) do
    FFNerd.get({:Schedule, %FFNerd.Url{service: "schedule", path1: position}}, client)
    |> Enum.map(&Game.new/1)
  end

  def current_week(client) do
    FFNerd.get({:currentWeek, %FFNerd.Url{service: "schedule"}}, client)
  end
end
