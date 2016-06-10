defmodule FFNerd.Client do
  defstruct auth: nil, endpoint: "http://www.fantasyfootballnerd.com"

  @doc """
  Create new client with default endpoint.

  ## Examples

    FFNerd.Client.new "API-KEY-ABC-XYZ"

  """
  def new(auth), do: %__MODULE__{auth: auth}

  @doc """
  Create new client with custom endpoint.

  ## Examples

    FFNerd.Client.new "API-KEY", "http://www.example.com"

  """
  def new(auth, endpoint), do: %__MODULE__{auth: auth, endpoint: endpoint}
end
