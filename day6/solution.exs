defmodule Solution do
  def solution(list, step \\ 0, set \\ MapSet.new()) do
    if list in set do
      step
    else
      list
      |> Enum.with_index
      |> Enum.max_by(fn {v, _i} -> v end)
      |> (fn {_v, i} -> redistribute(list, i) end).()
      |> solution(step + 1, MapSet.put(set, list))
    end
  end

  def solution2(list, step \\ 0, set \\ %{}) do
    if set[list] != nil do
      step - set[list]
    else
      list
      |> Enum.with_index
      |> Enum.max_by(fn {v, _i} -> v end)
      |> (fn {_v, i} -> redistribute(list, i) end).()
      |> solution2(step + 1, Map.put(set, list, step))
    end
  end

  def redistribute(list, index) do
    list
    |> Enum.at(index)
    |> (fn value -> { List.replace_at(list, index, 0), value} end).()
    |> (fn {updated_list, value} -> distribute(updated_list, index + 1, value) end).()
  end

  def distribute(list, _index, 0), do: list
  def distribute(list, index, value) do
    list
    |> List.update_at(rem(index, length(list)), &(&1 + 1))
    |> distribute(index + 1, value - 1)
  end
end

with {:ok, string} <- File.read("input.txt") do
  string
  |> String.trim
  |> String.split
  |> Enum.map(&String.to_integer/1)
  |> (fn arr -> { Solution.solution(arr), Solution.solution2(arr) } end).()
  |> IO.inspect
end

