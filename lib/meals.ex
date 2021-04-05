defmodule Meals do
  alias Meals.Meals.Create
  alias Meals.Meals.Delete
  alias Meals.Meals.Get
  alias Meals.Meals.List
  alias Meals.Meals.Update

  alias Meals.Users.Create, as: CreateUser

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate get_by_id(id), to: Get, as: :by_id
  defdelegate delete_by_id(id), to: Delete, as: :call
  defdelegate update_meal(params), to: Update, as: :call
  defdelegate list_meals(), to: List, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
end
