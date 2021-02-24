defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: "", max: "", algorithm: "", loading: false)
    {:ok, socket}
  end

  def handle_info({:start_sorting, algorithm, min, max}, socket) do
    # socket = assign(socket, algorithm: algorithm, min: min, max: max)
    # pid = self()
    # Task.start(fn -> Sort.sort(pid, min, max, algorithm) end)
    IO.inspect("xxxxxxx")
    {:noreply, socket}
  end

  def handle_info({:generate_new_data, min, max}, socket) do
    # socket = assign(socket, data: Enum.shuffle(min..max), min: min, max: max)
    socket = assign(socket, loading: true)
    send(self(), {:do_generate_new_data, min, max})
    {:noreply, socket}
  end

  def handle_info({:do_generate_new_data, min, max}, socket) do
    socket = assign(socket, data: Enum.shuffle(min..max), min: min, max: max, loading: false)
    {:noreply, socket}
  end
end
