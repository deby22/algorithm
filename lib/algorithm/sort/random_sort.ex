defmodule Algorithm.Sort.RandomSort do
  def sort(pid, data) do
    data = Enum.shuffle(data)
    send(pid, {:update_data, data})
    if data != Enum.sort(data), do: sort(pid, data)
  end
end
