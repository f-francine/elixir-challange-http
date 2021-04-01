defmodule ElixirChallangeTest do
  use ExUnit.Case
  doctest ElixirChallange

  test "greets the world" do
    assert ElixirChallange.hello() == :world
  end
end
