defmodule FFNerd.DraftRanking do
  defstruct [:bye_week, :display_name, :fname, :lname, :nerd_rank, :overall_rank, :ppr, :player_id, :position, :position_rank, :team]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Draft Ranking resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#draft-rankings
  """

  @doc """
  Return a list of draft ranking records.

  ## Examples

    FFNerd.DraftRanking.list client

    FFNerd.DraftRanking.list :ppr, client

  """
  def list(client) do
    {:DraftRankings, %FFNerd.URL{service: "draft-rankings"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end

  def list(:ppr, client) do
    {:DraftRankings, %FFNerd.URL{service: "draft-rankings", path1: "1"}}
    |> FFNerd.get(client)
    |> Enum.map(fn(x) -> new(x) |> Map.put(:ppr, "1") end)
  end

  @doc """
  Return a list of draft ranking records by position.

  ## Examples

    FFNerd.DraftRanking.list "QB", client

    FFNerd.DraftRanking.list :ppr, "QB", client

  """
  def list(position, client) do
    list(client) |> Enum.filter(&(&1.position == position))
  end

  def list(:ppr, position, client) do
    list(:ppr, client) |> Enum.filter(&(&1.position == position))
  end

  @doc """
  Return a single draft ranking record by person id.

  ## Examples

    FFNerd.DraftRanking.find 259, client

    FFNerd.DraftRanking.find :ppr, 259, client

  """
  def find(id, client) do
    list(client) |> Enum.find(&(&1.player_id == "#{id}"))
  end

  def find(:ppr, id, client) do
    list(:ppr, client) |> Enum.find(&(&1.player_id == "#{id}"))
  end
end
