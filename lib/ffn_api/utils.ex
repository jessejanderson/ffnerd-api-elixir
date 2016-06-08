defmodule FfnApi.Utils do
  def convert_to_atom_map(map) do
    for {key, val} <- map, into: %{}, do: {underscore_atom(key), val}
  end

  def underscore_atom(str) do
    str |> Macro.underscore |> String.to_atom
  end
end
