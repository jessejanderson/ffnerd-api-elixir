defmodule FfnApi do
  use HTTPoison.Base

  # TODO: Get these values dynamically
  @format "json"
  @api_key "test"

  def get({atom, %FfnApi.Url{} = url_struct}, %FfnApi.Client{auth: auth}) do
    raw = %FfnApi.Url{url_struct | api_key: auth}
    |> FfnApi.build_url
    |> FfnApi.get!
    raw.body[atom]
  end

  def build_url(%FfnApi.Url{service: service, format: _format, api_key: _api_key, path1: path1, path2: path2, path3: path3}) do
    "#{service}/#{@format}/#{@api_key}/#{path1}/#{path2}/#{path3}"
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
