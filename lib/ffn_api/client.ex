defmodule FfnApi.Client do
  defstruct auth: nil, endpoint: "http://www.fantasyfootballnerd.com"

  def new(auth), do: %__MODULE__{auth: auth}

  def new(auth, endpoint) do
    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
