defmodule Day1 do


  def sum([h]), do: 0
  def sum([h|t]), do: if h == hd(t), do: h + sum(t), else: sum(t)
  def sum(str) do
    [h|t] =
      str
      |> String.to_integer
      |> Integer.digits
    sum([h|t] ++ [h])
  end
end
