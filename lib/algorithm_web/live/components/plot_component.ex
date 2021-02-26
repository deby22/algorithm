defmodule AlgorithmWeb.SortPlotComponent do
  use AlgorithmWeb, :live_component

  def mount(_params, _session, socket) do
    socket = assign(socket, data: [], min: nil, max: nil, loading: false)
    {:ok, socket}
  end

  def update(assigns, socket) do
    IO.inspect({"update", self()})
    socket = assign(socket, assigns)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div class="plot">

    <ul class="chart">
    <%= for {old, num} <- Enum.zip(@old_data, @data) do %>
      <li>
        <span style="<%= if old != num, do: 'background-color:red;' %> height:<%= height(num, @min, @max) %>%"></span>
      </li>
      <% end %>
    </ul>

    </div>
    """
  end

  defp height(value, min, max) do
    range = max - min
    div((value - min) * 100, range)
  end
end
