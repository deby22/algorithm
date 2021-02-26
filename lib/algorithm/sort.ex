defmodule Algorithm.Sort do
  alias Algorithm.Sort.RandomSort
  alias Algorithm.Sort.BubbleSort
  alias Algorithm.Sort.InsertSort

  def sort(pid, data, algorithm) do
    case algorithm do
      "random" -> RandomSort.sort(data, pid)
      "bubble" -> BubbleSort.sort(data, pid)
      "insert" -> InsertSort.sort(data, pid)
      _ -> data
    end
  end

  def allowed_algorithms() do
    [
      ---: "",
      Random: "random",
      Bubble: "bubble",
      Insert: "insert"
    ]
  end
end
