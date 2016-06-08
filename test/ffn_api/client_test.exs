defmodule FfnApi.ClientTest do
  use ExUnit.Case
  import FfnApi.Client

  doctest FfnApi.Client

  test "default endpoint" do
    client = new("")
    assert client.endpoint == "http://www.fantasyfootballnerd.com"
  end

  test "custom endpoint" do
    client = new("", "http://www.example.com")
    assert client.endpoint == "http://www.example.com"
  end
end
