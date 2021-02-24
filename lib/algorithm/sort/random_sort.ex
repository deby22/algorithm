defmodule Algorithm.Sort.RandomSort do
  def sort(data) do
    IO.inspect(data, label: "dadatadatadatadatata")

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    IO.inspect(data, label: "sendsendsendsendsendsendsend 22222")

    :timer.sleep(300)
    IO.inspect(data, label: "dadatadatadatadatata 22222")

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    IO.inspect(data, label: "dadatadatadatadatata 33333333")

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    IO.inspect(data, label: "dadatadatadatadatata 77777")

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, false})
    :timer.sleep(300)

    data = Enum.shuffle(data)
    send(self(), {:sort, data, true})
    :timer.sleep(300)
    IO.inspect(data, label: "dadatadatadatadatata TRUETRUETRUETRUE")
  end
end
