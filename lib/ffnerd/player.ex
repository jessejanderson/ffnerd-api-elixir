defmodule FFNerd.Player do
  defstruct player_id: nil,
            star: nil,
            active: nil,
            jersey: nil,
            fname: nil,
            lname: nil,
            display_name: nil,
            team: nil,
            position: nil,
            height: nil,
            weight: nil,
            dob: nil,
            college: nil,
            twitter_id: nil
  use ExConstructor
  use HTTPoison.Base
  alias FFNerd.Client

  @doc """
  List players

  ## Examples

    FFNerd.Player.list client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """
  def list(client) do
    FFNerd.get({:Players, %FFNerd.Url{service: "players"}}, client)
    |> Enum.map(&new/1)
  end

  @doc """
  List players of a specified position

  ## Examples

    FFNerd.Player.list "QB", client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """
  def list(position, client) do
    FFNerd.get({:Players, %FFNerd.Url{service: "players", path1: position}}, client)
    |> Enum.map(&new/1)
  end


  @doc """
  Find a player by their id

  ## Examples

    FFNerd.Player.find 2, client

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#players
  """
  def find(id, client) do
    FFNerd.get({:Player, %FFNerd.Url{service: "player", path1: id}}, client)
    |> new
  end
end
