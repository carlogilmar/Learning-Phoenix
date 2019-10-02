defmodule PubSubDemoTest do
  use ExUnit.Case
  doctest PubSubDemo

  test "greets the world" do
    assert PubSubDemo.hello() == :world
  end
end
