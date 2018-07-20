defmodule NeemTest do
  use ExUnit.Case
  doctest Neem

  test "greets the world" do
    assert Neem.hello() == :world
  end
end
