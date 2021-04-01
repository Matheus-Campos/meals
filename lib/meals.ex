defmodule Meals do
  alias Meals.Meal.Create
  alias Meals.Meal.Delete
  alias Meals.Meal.Get
  alias Meals.Meal.List
  alias Meals.Meal.Update

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate get_by_id(id), to: Get, as: :by_id
  defdelegate delete_by_id(id), to: Delete, as: :call
  defdelegate update_meal(params), to: Update, as: :call
  defdelegate list_meals(), to: List, as: :call
end
