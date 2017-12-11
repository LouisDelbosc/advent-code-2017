if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("solution.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SolutionTest do
  use ExUnit.Case

  test "part 1 aa bb cc dd ee" do
    input = ~w(aa bb cc dd ee)
    assert Solution.duplicate?(input) == true
  end

  test "part 1 aa bb cc dd aa" do
    input = ~w"aa bb cc dd aa"
    assert Solution.duplicate?(input) == false
  end

  test "part 1 aa bb cc dd aaa" do
    input = ~w"aa bb cc dd aaa"
    assert Solution.duplicate?(input) == true
  end

  test "part 1 lines" do
    input = """
    aa bb cc dd ee
    aa bb cc dd aa
    aa bb cc dd aaa
    """
    assert Solution.count_valid(input) == 2
  end

  test "part 2 lines" do
    input = """
    oiii ioii iioi iiio
    abcde fghij
    abcde xyz ecdab
    a ab abc abd abf abj
    iiii oiii ooii oooi oooo
    """
    assert Solution.count_valid_2(input) == 3
  end
end
