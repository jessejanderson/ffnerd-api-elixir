defmodule FFNerd.DepthChart.Player do
  defstruct [
    :depth,
    :player_id,
    :player_name,
    :position,
    :team,
  ]
  use ExConstructor
end
