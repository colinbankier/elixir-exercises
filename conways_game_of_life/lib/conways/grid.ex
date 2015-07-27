defmodule Conways.Grid do
  defstruct data: nil

  def new(state) when is_list(state) do
    %Conways.Grid{data: state}
  end

  def new(size) when is_integer(size) do
    size |> random_grid |> new
  end

  def size(%Conways.Grid{data: data}) do
    Enum.count data
  end

  def next(grid) do
    %Conways.Grid{data: new_data(size(grid), &next_cell_status(grid, &1, &2))}
  end

  def as_list(grid) do
    grid.data
  end

  defp next_cell_status(grid, x, y) do
    case {cell_status(grid, x, y), alive_neighbours(grid, x, y)} do
      {1, 0} -> 0
      {_, _} -> 0
    end
  end

  defp new_data(size, generator) do
    for x <- 0..(size - 1) do
      for y <- 0..(size - 1) do
        generator.(x, y)
      end
    end

  end

  defp alive_neighbours(grid, x, y) do
    0
  end

  defp random_grid(size) do
    new_data(size, fn _, _ ->
    :random.uniform(2) - 1
    end)
  end

  def cell_status(grid, x, y) do
    grid
    |> as_list
    |> Enum.at(x)
    |> Enum.at(y)
  end
end
