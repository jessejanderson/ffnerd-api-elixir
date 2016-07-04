defmodule FFNerd.Inactive do
  defstruct [
    :display_name,
    :player_id,
    :position,
    :team,
    :week,
    :year,
  ]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Inactives resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#inactives
  """

  @doc """
  Return a list of inactive records.

  ## Examples

    FFNerd.Inactive.list client

  """
  def list(client) do
    {:Players, %FFNerd.URL{service: "inactives"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of inactive records by week.

  ## Examples

    FFNerd.Inactive.list 17, client

  """
  def list(week, client) do
    {:Players, %FFNerd.URL{service: "inactives", path1: week}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return an inactive record by player id.

  ## Examples

    FFNerd.Inactive.list 1465, client

  """
  def find(id, client) do
    list(client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  @doc """
  Return an inactive record by player id and week.

  ## Examples

    FFNerd.Inactive.list 259, 17, client

  """
  def find(id, week, client) do
    list(week, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
