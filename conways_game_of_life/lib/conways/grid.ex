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

  defp random_grid(size) do
    for x <- 0..(size - 1) do
      for y <- 0..(size - 1) do
        :random.uniform(2) - 1
      end
    end
  end

  def cell_status(grid, x, y) do
    grid.data
    |> Enum.at(x)
    |> Enum.at(y)
  end
end
