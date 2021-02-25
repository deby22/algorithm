defmodule Algorithm.Sort.BubbleSort do
  # :timer.sleep(1)
  # send(pid, {:update_data, data, true})
  # send(pid, {:update_data, data, false})
  def sort([], pid), do: []
  def sort(list, pid) do
    sort(list, [], true, pid)
  end
  def sort([a, b | list] = data, acc, _, pid) when a > b do
    send_with_delay(pid, Enum.reverse(data) ++ acc, false)
    sort([a | list], [b | acc], false, pid)
  end

  def sort([a, b | list] = data, acc, done, pid) do
    send_with_delay(pid,  Enum.reverse(data) ++ acc, false)
    sort([b | list], [a | acc], done, pid)
  end
  def sort([a], acc, true, pid) do
    send_with_delay(pid, [a | acc], true)
    [a | acc] |> Enum.reverse
  end
  def sort([a], acc, false, pid) do
    [a | acc] |> Enum.reverse |> sort(pid)
  end

  defp send_with_delay(pid, data, sorted) do
    :timer.sleep(1)
    send(pid, {:update_data, data, sorted})
  end


end
