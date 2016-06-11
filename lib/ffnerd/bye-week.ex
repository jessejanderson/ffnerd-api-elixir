defmodule FFNerd.ByeWeek do
  defstruct bye_week: nil,
            display_name: nil,
            team: nil
  use ExConstructor
  use HTTPoison.Base

  @doc """
  Return a list of all bye week records.

  ## Examples

    FFNerd.ByeWeek.list 4, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#byes
  """
  def list(client) do
    FFNerd.get({:none, %FFNerd.Url{service: "byes"}}, client)
    |> Stream.flat_map(fn{_, v} -> v end)
    |> Enum.map(&new/1)
  end

  @doc """
  Return a list of bye week records by week number.

  ## Examples

    FFNerd.ByeWeek.list 4, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#byes
  """
  def list(id, client) do
    list(client) |> Enum.filter(&(&1.bye_week == "#{id}"))
  end

  @doc """
  Return a single bye week record by team code.

  ## Examples

    FFNerd.ByeWeek.find "SEA", client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#byes
  """
  def find(team, client) do
    list(client) |> Enum.find(&(&1.team == team))
  end
end
