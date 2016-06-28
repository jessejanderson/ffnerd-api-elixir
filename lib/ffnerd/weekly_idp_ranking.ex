defmodule FFNerd.WeeklyIDPRanking do
  defstruct [:player, :position, :rank, :team]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Weekly Ranking resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#weekly-idp
  """

  @doc """
  Return a list of weekly idp ranking records.

  ## Examples

    FFNerd.WeeklyIDPRanking.list client

    FFNerd.WeeklyIDPRankingDraftRanking.list :ppr, client

  """
  def list(client) do
    {:rankings, %FFNerd.URL{service: "weekly-idp"}}
    |> FFNerd.get(client)
    |> Enum.map(&new/1)
  end


  @doc """
  Return a list of weekly idp ranking records by position using the current week.

  ## Examples

  FFNerd.WeeklyIDPRanking.list "DE", client

  """
  def list(position, client) do
    list(client) |> Enum.filter(&(&1.position == position))
  end
end
