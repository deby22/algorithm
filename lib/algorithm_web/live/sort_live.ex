defmodule AlgorithmWeb.SortLive do
  use AlgorithmWeb, :live_view

  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "sort")

    socket =
      assign(socket, data: [], old_data: [], min: "", max: "", algorithm: "", sort_pid: nil)

    {:ok, socket}
  end

  def handle_info({:start_sorting, algorithm, data}, socket) do
    # socket = assign(socket, algorithm: algorithm, min: min, max: max)
    pid = self()
    {:ok, sort_pid} = Task.start(fn -> Sort.sort(pid, data, algorithm) end)
    {:noreply, assign(socket, sort_pid: sort_pid)}
  end

  def handle_info(:stop_sorting, socket) do
    # socket = assign(socket, algorithm: algorithm, min: min, max: max)
    IO.inspect("stop!!!!!!!!!!")
    {:noreply, stop_sorting(socket)}
  end

  def handle_info({:generate_new_data, min, max}, socket) do
    data = Enum.shuffle(min..max)

    socket =
      socket
      |> assign(data: data, old_data: data, min: min, max: max)
      |> stop_sorting()

    {:noreply, socket}
  end

  def handle_info({:update_data, data, sorted}, socket) do
    IO.inspect(self(), label: "sort info")

    old_data = socket.assigns.data
    socket = assign(socket, old_data: old_data, data: data)

    if sorted do
      {:noreply, stop_sorting(socket)}
    else
      {:noreply, socket}
    end
  end

  def stop_sorting(socket) do
    pid = socket.assigns.sort_pid

    IO.inspect({"stop", pid})

    if pid do
      Process.exit(pid, :kill)
    end

    assign(socket, sort_pid: nil)
  end
end
