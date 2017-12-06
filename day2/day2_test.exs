if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("day2.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day2Test do
  use ExUnit.Case

  test "simple square part 1" do
    input = """
    5 1 9 5
    7 5 3
    2 4 6 8
    """
    assert Day2.checksum_part1(input) == 18
  end

  test "simple square part 2" do
    input = """
      5 9 2 8
      9 4 7 3
      3 8 6 5
    """
    assert Day2.checksum_part2(input) == 9
  end
end
