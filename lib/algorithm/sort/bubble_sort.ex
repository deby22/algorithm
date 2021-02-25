defmodule Algorithm.Sort.BubbleSort do
  # :timer.sleep(1)
  # send(pid, {:update_data, data, true})
  # send(pid, {:update_data, data, false})
  def sort(pid, list) when is_list(list) do
    make_pass(do_sort(list, []), list, pid)
  end

  def make_pass(bubbled_list, old_list, pid) when bubbled_list != old_list do
    :timer.sleep(10)
    send(pid, {:update_data, bubbled_list, false})
    do_sort(bubbled_list, []) |> make_pass(bubbled_list, pid)
  end

  def make_pass(bubbled_list, old_list, pid) when bubbled_list == old_list do
    :timer.sleep(10)
    send(pid, {:update_data, bubbled_list, true})
    bubbled_list
  end

  def do_sort(_list = [], _acc) do
    []
  end

  def do_sort([first | []], acc) do
    acc ++ [first]
  end

  def do_sort([first | [second | tail]], acc) do
    [new_first, new_second] = swap(first, second)
    do_sort([new_second | tail], acc ++ [new_first])
  end

  defp swap(e1, e2) do
    if e1 <= e2 do
      [e1, e2]
    else
      [e2, e1]
    end
  end
end
