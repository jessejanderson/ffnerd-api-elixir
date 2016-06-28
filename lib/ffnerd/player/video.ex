defmodule FFNerd.Player.Video do
  defstruct [
    :video_title,
    :youtube_id,
  ]

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's Player Videos resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#player
  """

  @doc """
  Convert raw api data to Player.Video struct.
  """
  def new(map) do
    %FFNerd.Player.Video{
      video_title: map["videoTitle"],
      youtube_id:  map["youTubeId"],
    }
  end

  @doc """
  Return a list of player video records by player id.

  ## Examples

  FFNerd.Player.Video.list 14, client

  """
  def list(id, client) do
    {:Videos, %FFNerd.URL{service: "player", path1: id}}
    |> FFNerd.get(client)
    |> Enum.map(&(new(&1)))
  end
end
