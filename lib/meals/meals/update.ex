defmodule Meals.Meals.Update do
  alias Meals.{Error, Meal, Repo}

  def call(%{"id" => meal_id} = params) do
    case Repo.get(Meal, meal_id) do
      nil -> {:error, Error.build_meal_not_found()}
      meal -> update(meal, params)
    end
  end

  defp update(%Meal{} = meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
