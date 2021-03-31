defmodule Meals do
  alias Meals.Meal.Create
  alias Meals.Meal.Delete
  alias Meals.Meal.Get

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate get_by_id(id), to: Get, as: :by_id
  defdelegate delete_by_id(id), to: Delete, as: :call
end
