defmodule AlgorithmWeb.SortFormComponent do
  use AlgorithmWeb, :live_component
  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    socket = assign(socket, min: "", max: "", algorithm: "", data: [])
    {:ok, socket}
  end

  # def update(assigns, socket) do
  #   {:ok, assign(socket, assigns)}
  # end

  def render(assigns) do
    ~L"""

    <form phx-target="<%= @myself %>"  phx-submit="new_data">
      <input type="number" name="min" value="<%= @min %>"
              placeholder="Start" autofocus="off" phx-debounce="500" />

      <input type="number" name="max" value="<%= @max %>"
                  placeholder="End" autofocus="off" phx-debounce="500"/>
      <button type="submit">
            New data
        </button>

    </form>
    <form phx-target="<%= @myself %>"  phx-submit="sort">
      <select name="algorithm">
        <%= options_for_select(type_options(), @algorithm) %>
      </select>
      <button type="submit">
        Start sorting
      </button>
          </form>

      <button phx-target="<%= @myself %>" phx-click="stop">
        Stop
      </button>



    """
  end

  defp type_options do
    Sort.allowed_algorithms()
  end

  def handle_event("sort", %{"algorithm" => algorithm}, socket) do
    # send information do parent -  AlgorithmWeb.SortLive
    send(self(), {:start_sorting, algorithm, socket.assigns.data})
    {:noreply, socket}
  end

  def handle_event("new_data", %{"min" => min, "max" => max}, socket) do
    # send information do parent -  AlgorithmWeb.SortLive
    generate_new_data(min, max)
    {:noreply, socket}
  end

  def handle_event("stop", _params, socket) do
    send(self(), :stop_sorting)
    {:noreply, socket}
  end

  def generate_new_data(min, max) when min == "" or max == "", do: nil

  def generate_new_data(min, max) do
    min = String.to_integer(min)
    max = String.to_integer(max)

    if min < max do
      send(self(), {:generate_new_data, min, max})
    end
  end
end
