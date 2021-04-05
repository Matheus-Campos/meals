defmodule Meals do
  alias Meals.Meals.Create, as: CreateMeal
  alias Meals.Meals.Delete, as: DeleteMeal
  alias Meals.Meals.Get, as: GetMeal
  alias Meals.Meals.List, as: ListMeals
  alias Meals.Meals.Update, as: UpdateMeal

  alias Meals.Users.Create, as: CreateUser

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate get_by_id(id), to: GetMeal, as: :by_id
  defdelegate delete_by_id(id), to: DeleteMeal, as: :call
  defdelegate update_meal(params), to: UpdateMeal, as: :call
  defdelegate list_meals(), to: ListMeals, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
end
