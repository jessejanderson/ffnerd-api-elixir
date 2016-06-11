defmodule FFNerd do
  use HTTPoison.Base

  # TODO: Get these values dynamically
  @format "json"
  @api_key "test"

  def get({atom, %FFNerd.Url{} = url_struct}, %FFNerd.Client{auth: auth}) do
    %FFNerd.Url{url_struct | api_key: auth}
    |> FFNerd.build_url
    |> FFNerd.get!
    |> do_get(atom)
  end
  defp do_get(raw, :none), do: raw.body
  defp do_get(raw, atom), do: raw.body[atom]

  def build_url(%FFNerd.Url{service: service, format: _format, api_key: _api_key, path1: path1, path2: path2, path3: path3}) do
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
