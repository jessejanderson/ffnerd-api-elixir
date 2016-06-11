defmodule FFNerd.ByeWeek do
  defstruct [:bye_week, :display_name, :team]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Bye Week resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#byes
  """

  @doc """
  Return a list of all bye week records.

  ## Examples

    FFNerd.ByeWeek.list 4, client

  """
  def list(client) do
    {:none, %FFNerd.URL{service: "byes"}}
    |> FFNerd.get(client)
    |> Stream.flat_map(fn{_, v} -> v end)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of bye week records by week number.

  ## Examples

    FFNerd.ByeWeek.list 4, client

  """
  def list(id, client) do
    client |> list |> Enum.filter(&(&1.bye_week == "#{id}"))
  end

  @doc """
  Return a single bye week record by team code.

  ## Examples

    FFNerd.ByeWeek.find "SEA", client

  """
  def find(team, client) do
    client |> list |> Enum.find(&(&1.team == team))
  end
end
