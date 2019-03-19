defmodule SendleTestTest do
  use ExUnit.Case
  doctest SendleTest

  test "greets the world" do
    assert SendleTest.hello() == :world
  end
end
