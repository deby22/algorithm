defmodule Algorithm.Sort.InsertSort do
  def sort([], _pid), do: []

  def sort(list, pid) do
    sort([], list, pid)
  end

  def sort(acc, [], pid) do
    send_with_delay(pid, acc, true)
    acc
  end

  def sort(acc, [head | list], pid) do
    {left, right} = Enum.split_while(acc, &(&1 < head))
    acc = left ++ [head | right]
    send_with_delay(pid, acc ++ list, false)
    sort(acc, list, pid)
  end

  defp send_with_delay(pid, data, sorted) do
    :timer.sleep(10)
    send(pid, {:update_data, data, sorted})
  end
end
