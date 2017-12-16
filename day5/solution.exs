defmodule Solution do

  def solution(map, index \\ 0, step \\ 0) do
    if map[index] != nil do
      new_index = index + map[index]
      map
      |> Map.update(index, 0, &(&1 + 1))
      |> solution(new_index, step + 1)
    else
      step
    end
  end

  def solution2(map, index \\ 0, step \\ 0) do
    if map[index] != nil do
      new_index = index + map[index]
      map
      |> Map.update(index, 0, fn x -> if x >= 3, do: x - 1, else: x + 1 end)
      |> solution2(new_index, step + 1)
    else
      step
    end
  end

  def solution_from_file(file, func) do
    with {:ok, string} <- File.read(file) do
      string
      |> String.trim
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Stream.with_index
      |> Stream.map(fn {instruction, index} -> {index, instruction} end)
      |> Map.new
      |> func.()
    end
  end
end

# Solution.solution_from_file("input.txt", &Solution.solution/1) |> IO.inspect
# Solution.solution_from_file("input.txt", &Solution.solution2/1) |> IO.inspect
