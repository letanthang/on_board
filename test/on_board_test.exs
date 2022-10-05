defmodule OnBoardTest do
  use ExUnit.Case
  doctest OnBoard

  test "greets the world" do
    assert OnBoard.hello() == :world
  end
end
