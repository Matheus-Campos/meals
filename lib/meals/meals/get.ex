defmodule Meals.Meals.Get do
  alias Meals.{Error, Meal, Repo}

  def by_id(id) do
    Repo.get(Meal, id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, Error.build_meal_not_found()}
  defp handle_get(%Meal{} = meal), do: {:ok, meal}
end
