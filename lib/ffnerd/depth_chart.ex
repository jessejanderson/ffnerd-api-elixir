defmodule FFNerd.DepthChart do
  defstruct [:fb, :qb, :rb, :te, :wr1, :wr2]
  alias FFNerd.DepthChart.Player

  @positions ~w[FB QB RB TE WR1 WR2]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Depth Chart resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#depth-charts
  """

  @doc """
  Convert raw api data to DepthChart struct.
  """
  def new(map) do
    %FFNerd.DepthChart{
      fb:  map["FB"],
      qb:  map["QB"],
      rb:  map["RB"],
      te:  map["TE"],
      wr1: map["WR1"],
      wr2: map["WR2"],
    }
  end

  @doc """
  Return a list of depth chart records.

  ## Examples

    FFNerd.DepthChart.list client

  """
  def list(client) do
    {:DepthCharts, %FFNerd.URL{service: "depth-charts"}}
    |> FFNerd.get(client)
    |> Enum.map(fn{k, v} ->
         {k, Enum.map(v, fn{k, v} ->
           {k, Enum.map(v, fn(x) ->
             Player.new(x)
           end)}
         end) |> Enum.into(%{}) |> new}
       end)
    |> Enum.into(%{})
  end

  @doc """
  Return a team's depth chart record by team code.

  ## Examples

    FFNerd.DepthChart.find "SEA", client

  """
  def find(team, client) do
    {:DepthCharts, %FFNerd.URL{service: "depth-charts"}}
    |> FFNerd.get(client)
    |> Map.get(team)
    |> Enum.map(fn{k, v} ->
         {k, Enum.map(v, fn(x) ->
           Player.new(x)
         end)}
       end)
    |> Enum.into(%{})
    |> new
  end

  @doc """
  Return a team's position depth chart record by team code and position.

  ## Examples

    FFNerd.DepthChart.find "SEA", "QB", client

  """
  def find(team, position, client) when position in @positions do
    find(team, client)
    |> Map.get(convert_json_string_to_atom(position))
  end

  @doc """
  Return a depth chart player record by team code, position, and depth.

  ## Examples

    FFNerd.DepthChart.find "SEA", "QB", 1, client

  """
  def find(team, position, depth, client) when position in @positions do
    find(team, position, client)
    |> Enum.find(fn(x) -> Map.get(x, :depth) == "#{depth}" end)
  end

  defp convert_json_string_to_atom(str), do: str |> String.downcase |> String.to_atom
end
