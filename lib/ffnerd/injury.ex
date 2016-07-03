defmodule FFNerd.Injury do
  defstruct [
    :game_status,
    :injury,
    :last_update,
    :notes,
    :player_id,
    :player_name,
    :position,
    :practice_status,
    :practice_status_id,
    :team,
    :week,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Injury resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#injuries
  """

  @doc """
  Convert raw api data to Player.Injury struct.
  """
  def new(map) do
    %FFNerd.Injury{
      game_status:        map["gameStatus"],
      injury:             map["injury"],
      last_update:        map["lastUpdate"],
      notes:              map["notes"],
      player_id:          map["playerId"],
      player_name:        map["playerName"],
      position:           map["position"],
      practice_status:    map["practiceStatus"],
      practice_status_id: map["practiceStatusId"] |> int_to_str,
      team:               map["team"],
      week:               map["week"],
    }
  end

  @doc """
  Return a list of injury records.

  ## Examples

    FFNerd.Injury.list client

  """
  def list(client) do
    {:Injuries, %FFNerd.URL{service: "injuries"}}
    |> FFNerd.get(client)
    |> Enum.map(fn{k, v} ->
         {k, Enum.map(v, &(new(&1)))}
       end)
    |> Enum.into(%{})
  end

  @doc """
  Return a list of injury records by week.

  ## Examples

    FFNerd.Injury.list 17, client

  """
  def list(week, client) when is_integer(week) do
    {:Injuries, %FFNerd.URL{service: "injuries", path1: week}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of current week injury records by team.

  ## Examples

    FFNerd.Injury.list "SEA", client

  """
  def list(team, client) do
    {:Injuries, %FFNerd.URL{service: "injuries"}}
    |> FFNerd.get(client)
    |> Map.get(team)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of injury records by team and week.

  ## Examples

    FFNerd.Injury.list "SEA", 17, client

  """
  def list(team, week, client) do
    {:Injuries, %FFNerd.URL{service: "injuries", path1: week}}
    |> FFNerd.get(client)
    |> Map.get(team)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a single injury record by player id and team code.

  ## Examples

    FFNerd.Injury.find 1465, "SEA", client

  """
  def find(id, team, client) do
    list(team, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  @doc """
  Return a single injury record by player id, team code, and week.

  ## Examples

    FFNerd.Injury.find 1465, "SEA", 17, client

  """
  def find(id, team, week, client) do
    list(team, week, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  defp int_to_str(int) when is_integer(int), do: int |> Integer.to_string
  defp int_to_str(str) when is_binary(str) , do: str
end
