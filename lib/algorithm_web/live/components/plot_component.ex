defmodule AlgorithmWeb.SortPlotComponent do
  use AlgorithmWeb, :live_component

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: nil, max: nil, loading: false)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div class="plot">

      <%= if @loading do %>
       <div class="loader">
         Loading...
       </div>
       <% else %>

    <ul class="chart">
    <%= for num <- @data do %>
      <li>
        <span style="height:<%= height(num, @min, @max) %>%"></span>
      </li>
      <% end %>
    </ul>
    <% end %>

    </div>
    """
  end

  defp height(value, min, max) do
    range = max - min
    div((max - value) * 100, range)
  end
end
