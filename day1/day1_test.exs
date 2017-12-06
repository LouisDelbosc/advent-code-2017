if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("day1.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day1Test do
  use ExUnit.Case

  test "1122" do
    assert Day1.sum("1122") == 3
  end

  test "1111" do
    assert Day1.sum("1111") == 4
  end

  test "1234" do
    assert Day1.sum("1234") == 0
  end

  test "91212129" do
    assert Day1.sum("91212129") == 9
  end

  test "part2 1212" do
    assert Day1.sum2("1212") == 6
  end

  test "part2 1221" do
    assert Day1.sum2("1221") == 0
  end

  test "part2 123425" do
    assert Day1.sum2("123425") == 4
  end

  test "part2 123123" do
    assert Day1.sum2("123123") == 12
  end

  test "part2 12131415" do
    assert Day1.sum2("12131415") == 4
  end

end
