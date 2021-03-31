defmodule Meals.Meal.Delete do
  alias Meals.{Error, Meal, Repo}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      meal -> Repo.delete(meal)
    end
  end
end
