defmodule FfnApi do
  use HTTPoison.Base

  # TODO: Get these values dynamically
  @format "json"
  @api_key "test"

  def build_url(%FfnApi.Url{service: service, format: _format, api_key: _api_key, param1: param1, param2: param2, param3: param3}) do
    "#{service}/#{@format}/#{@api_key}/#{param1}/#{param2}/#{param3}"
    |> String.strip(?/)
  end

  def process_url(url) do
    "http://www.fantasyfootballnerd.com/service/" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
