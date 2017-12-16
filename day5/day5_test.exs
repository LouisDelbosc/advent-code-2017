if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("solution.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SolutionTest do
  use ExUnit.Case
  test "part 1 example" do
    assert Solution.solution(
      %{
        0 => 0,
        1 => 3,
        2 => 0,
        3 => 1,
        4 => -3
      }) == 5
  end

  test "part 2 example" do
    assert Solution.solution2(
      %{
        0 => 0,
        1 => 3,
        2 => 0,
        3 => 1,
        4 => -3
      }) == 10
  end
end
