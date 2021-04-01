defmodule Meals.Meal.List do
  alias Meals.{Meal, Repo}

  def call, do: Repo.all(Meal)
end
