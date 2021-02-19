defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: "", max: "")
    {:ok, socket}
  end

  defp restart(params, socket) do
    %{
      "min" => min,
      "max" => max
    } = params

    data = generate_data_or_clear_data(min, max)

    socket =
      socket
      |> put_communicate(data)
      |> assign(
        min: min,
        max: max,
        data: data
      )
  end

  defp put_communicate(socket, data) do
    if length(data) > 0 do
      socket
      |> clear_flash()
      |> put_flash(:info, "New data has been shufled")
    else
      socket
      |> clear_flash()
      |> put_flash(:error, "Fill min and Max to generate new data")
    end
  end

  defp generate_data_or_clear_data(min, max) when min == "" or max == "", do: []

  defp generate_data_or_clear_data(min, max) do
    min = String.to_integer(min)
    max = String.to_integer(max)
    if min < max, do: Enum.shuffle(min..max), else: []
  end

  def handle_event("update", params, socket) do
    socket = restart(params, socket)
    IO.inspect(socket.assigns)
    {:noreply, socket}
  end
end
