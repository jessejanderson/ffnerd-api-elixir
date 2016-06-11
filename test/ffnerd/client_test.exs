defmodule FFNerd.ClientTest do
  use ExUnit.Case, async: true
  import FFNerd.Client

  doctest FFNerd.Client

  test "default endpoint" do
    client = new("")
    assert client.endpoint == "http://www.fantasyfootballnerd.com"
  end

  test "custom endpoint" do
    client = new("", "http://www.example.com")
    assert client.endpoint == "http://www.example.com"
  end
end
