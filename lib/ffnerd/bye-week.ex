defmodule FFNerd.ByeWeek do
  defstruct bye_week: nil,
            display_name: nil,
            team: nil
  use ExConstructor
  use HTTPoison.Base

  @doc """
  List teams by bye week

  ## Examples

    FFNerd.ByeWeek.list 4, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#byes
  """
  def list(id, client) do
    FFNerd.get({:"Bye Week #{id}", %FFNerd.Url{service: "byes"}}, client)
    |> Enum.map(&new/1)
  end
end
