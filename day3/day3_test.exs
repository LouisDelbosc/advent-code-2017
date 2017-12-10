if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("day3.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day3Test do
  use ExUnit.Case

  test "part 1 1" do
    assert Day3.solution(1) == 0
  end

  test "part 1 12" do
    assert Day3.solution(12) == 3
  end

  test "part 1 23" do
    assert Day3.solution(23) == 2
  end

  test "part 1 1024" do
    assert Day3.solution(1024) == 31
  end
end
