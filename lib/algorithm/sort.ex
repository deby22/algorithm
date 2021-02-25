defmodule Algorithm.Sort do
  alias Algorithm.Sort.RandomSort
  alias Algorithm.Sort.BubbleSort

  def sort(pid, data, algorithm) do
    case algorithm do
      "random" -> RandomSort.sort(pid, data)
      "bubble" -> BubbleSort.sort(pid, data)
      _ -> data
    end
  end

  def allowed_algorithms() do
    [
      ---: "",
      Random: "random",
      Bubble: "bubble"
    ]
  end
end
