if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("solution.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SolutionTest do
  use ExUnit.Case

  test "part 1 example" do
    assert Solution.solution([0, 2, 7, 0]) == 5
  end

  test "part 2 example" do
    assert Solution.solution2([0, 2, 7, 0]) == 4
  end

end

defmodule UtilsTest do
  use ExUnit.Case

  test "distribute" do
    assert Solution.distribute([0, 2, 0, 0], 3, 7) == [2, 4, 1, 2]
  end

  test "redistribute" do
    assert Solution.redistribute([0, 2, 7, 0], 2) == [2, 4, 1, 2]
  end
end
