defmodule Algorithm.Sort do
  alias Algorithm.Sort.RandomSort

  def sort(pid, data, algorithm) do
    IO.inspect(algorithm, label: "algorithmalgorithmalgorithmalgorithm")

    case algorithm do
      "random" -> RandomSort.sort(pid, data)
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
