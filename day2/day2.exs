defmodule Day2 do

  def checksum(str) do
    str
    |> String.split("\n")
    |> Enum.map(&process_line/1)
    |> Enum.sum
  end

  def process_line(""), do: 0
  def process_line(line) do
    Regex.scan(~r/\d+/, line)
    |> List.flatten
    |> Enum.map(&String.to_integer/1)
    |> (fn arr -> Enum.min_max(arr) end).()
    |> (fn {min, max} -> max - min end).()
  end
end
