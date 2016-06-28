defmodule FFNerd.Player.VideoTest do
  use ExUnit.Case
  import FFNerd.Player.Video

  doctest FFNerd.Player.Video

  @client FFNerd.Client.new("test")

  setup_all do
    HTTPoison.start
  end

  test "Return a list of all player video records by player id." do
    assert [%FFNerd.Player.Video{} | _rest] = list(14, @client)
  end

  test "Return all video details from a player video record." do
    video = list(14, @client) |> List.first

    assert "NFL Top 100 Players of 2012 : Drew Brees #2" = video.video_title
    assert "9cMvQ-uD4aI"                                = video.youtube_id
  end
end
