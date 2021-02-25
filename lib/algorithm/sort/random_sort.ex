defmodule Algorithm.Sort.RandomSort do
  def sort(data, pid) do
    data = Enum.shuffle(data)
    :timer.sleep(1)

    if data == Enum.sort(data) do
      send(pid, {:update_data, data, true})
    else
      send(pid, {:update_data, data, false})
      sort(data, pid)
    end
  end
end
