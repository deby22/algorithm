defmodule Algorithm.Sort do
  alias Algorithm.Sort.RandomSort

  def sort(algorithm, data) do
    case algorithm do
      "random" -> RandomSort.sort(data)
      _ -> data
    end
  end

  def allowed_algorithms() do
    [
      ---: "",
      "Random 2": "random",
      "Random 3": "random"
    ]
  end
end
