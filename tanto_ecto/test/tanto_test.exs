defmodule TantoTest do
  use ExUnit.Case
  doctest Tanto

  test "greets the world" do
    assert Tanto.hello() == :world
  end
end
