defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: "", max: "", algorithm: "")
    {:ok, socket}
  end

  def handle_info({:start_sorting, algorithm, data}, socket) do
    # socket = assign(socket, algorithm: algorithm, min: min, max: max)
    pid = self()
    Task.start(fn -> Sort.sort(pid, data, algorithm) end)
    {:noreply, socket}
  end

  def handle_info({:generate_new_data, min, max}, socket) do
    socket = assign(socket, data: Enum.shuffle(min..max), min: min, max: max)
    {:noreply, socket}
  end

  def handle_info({:update_data, data}, socket) do
    socket = assign(socket, data: data)
    {:noreply, socket}
  end
end
