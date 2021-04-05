defmodule Meals.Meals.Get do
  import Ecto.Query

  alias Meals.{Error, Meal, Repo}

  def by_id(id) do
    query = from meal in Meal, where: meal.id == ^id, preload: [:user]

    query
    |> Repo.one()
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, Error.build_meal_not_found()}
  defp handle_get(%Meal{} = meal), do: {:ok, meal}
end
