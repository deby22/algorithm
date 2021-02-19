defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: nil, max: nil)
    {:ok, socket}
  end

  defp restart(params, socket) do
    %{
      "min" => min,
      "max" => max
    } = params

    assign(socket, min: min, max: max)
  end

  def handle_event("update", params, socket) do
    socket = restart(params, socket)
    {:noreply, socket}
  end
end
