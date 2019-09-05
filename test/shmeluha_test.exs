defmodule ShmeluhaTest do
  use ExUnit.Case
  doctest Shmeluha

  test "greets the world" do
    assert Shmeluha.hello() == :world
  end
end
