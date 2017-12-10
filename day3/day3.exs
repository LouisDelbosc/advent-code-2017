defmodule Day3 do

  def solution(1), do: 0
  def solution(number), do: number |> ring_index |> get_distance(number)

  def get_distance(index, number) do
    index
    |> generate_ring
    |> Enum.zip(
      Stream.cycle( Enum.to_list(index-1..0) ++ Enum.to_list(1..index))
    )
    |> Enum.find(fn {x, _} -> x == number end)
    |> (fn {_, d} -> d + index end).()
  end

  def ring_index(number) do
    number
    |> :math.sqrt
    |> Float.ceil
    |> Kernel./(2)
    |> trunc
  end

  def generate_ring(0), do: [1]
  def generate_ring(ring_index) do
    ring_index - 1
    |> generate_ring
    |> (fn prev_ring -> ring_range(ring_index, Enum.max(prev_ring) + 1) end).()
  end

  def ring_range(index, start) do
    start..(start + (index * 2 * 4) - 1)
    |> Enum.to_list
  end
end

Day3.solution(312051) |> IO.inspect
