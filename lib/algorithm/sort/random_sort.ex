defmodule Algorithm.Sort.RandomSort do
  def sort(pid, data) do
    data = Enum.shuffle(data)

    if data == Enum.sort(data) do
      send(pid, {:update_data, data, true})
    else
      send(pid, {:update_data, data, false})
      sort(pid, data)
    end
  end
end
