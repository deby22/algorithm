defmodule AlgorithmWeb.SortFormComponent do
  use AlgorithmWeb, :live_component
  alias Algorithm.Sort

  def mount(_params, _session, socket) do
    socket = assign(socket, min: "", max: "", algorithm: "")
    {:ok, socket}
  end

  # def update(assigns, socket) do
  #   {:ok, assign(socket, assigns)}
  # end

  def render(assigns) do
    ~L"""

    <form phx-change="update" phx-target="<%= @myself %>"  phx-submit="sort">
      <input type="number" name="min" value="<%= @min %>"
              placeholder="Start" autofocus="off" phx-debounce="500" />

      <input type="number" name="max" value="<%= @max %>"
                  placeholder="End" autofocus="off" phx-debounce="500"/>

          <span><%= @min %></span> : <span><%= @max %></span>

        <select name="algorithm">
            <%= options_for_select(type_options(), @algorithm) %>
        </select>
        <button type="submit">
            Sort
        </button>
    </form>
    """
  end

  defp type_options do
    Sort.allowed_algorithms()
  end

  def handle_event("sort", %{"algorithm" => algorithm, "min" => min, "max" => max}, socket) do
    # send information do parent -  AlgorithmWeb.SortLive
    send(self(), {:start_sorting, algorithm, min, max})
    {:noreply, socket}
  end

  def handle_event("update", %{"min" => min, "max" => max}, socket) do
    # send information do parent -  AlgorithmWeb.SortLive
    generate_new_data(min, max)
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
