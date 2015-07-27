defmodule Conways.GridTest do
  use ExUnit.Case
  alias Conways.Grid

  test "can create a grid from a list" do
    initial_state = [
      [0, 1, 0],
      [0, 1, 0],
      [0, 1, 0]
    ]
    grid = Grid.new initial_state

    for row <- 0..2 do
      for element <- 0..2 do
        expected = initial_state
        |> Enum.at(row)
        |> Enum.at(element)

        assert Grid.cell_status(grid, row, element) == expected
      end
    end
  end

  test "can generate a random grid" do
    grid = Grid.new 9

    for row <- 0..2 do
      for element <- 0..2 do
        assert grid_value?(Grid.cell_status(grid, row, element))
      end
    end
  end

  test "can retreive grid size" do
    grid = Grid.new 11

    assert Grid.size(grid) == 11
  end

  def grid_value?(0), do: true
  def grid_value?(1), do: true
  def grid_value?(val), do: false

end
