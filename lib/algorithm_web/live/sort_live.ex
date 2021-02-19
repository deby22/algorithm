defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: "", max: "", algorithm: "")
    {:ok, socket}
  end

  defp new_data(params, socket) do
    %{
      "min" => min,
      "max" => max
    } = params

    data = generate_data_or_clear_data(min, max)

    socket
    |> new_data_communicate(data)
    |> assign(
      min: min,
      max: max,
      data: data
    )
  end

  defp new_data_communicate(socket, data) do
    if length(data) > 0 do
      put_communicate(socket, :info, "New data has been generated")
    else
      put_communicate(socket, :error, "Fill valid Min and Max to generate new data")
    end
  end

  defp put_communicate(socket, status, message) do
    socket
    |> clear_flash()
    |> put_flash(status, message)
  end

  defp generate_data_or_clear_data(min, max) when min == "" or max == "", do: []

  defp generate_data_or_clear_data(min, max) do
    min = String.to_integer(min)
    max = String.to_integer(max)
    if min < max, do: Enum.shuffle(min..max), else: []
  end

  def handle_event("update", params, socket) do
    socket = new_data(params, socket)
    {:noreply, socket}
  end

  defp type_options do
    Sort.allowed_algorithms()
  end

  def handle_event("sort", %{"algorithm" => algorithm}, socket) do
    socket =
      socket
      |> clear_flash()
      |> sort_communicate(algorithm)
      |> assign(algorithm: algorithm)

    {:noreply, socket}
  end

  defp sort_communicate(socket, algorithm) do
    if algorithm != "" do
      put_communicate(socket, :info, "Start shuffling ...")
    else
      put_communicate(socket, :error, "Choose algorithm")
    end
  end
end
