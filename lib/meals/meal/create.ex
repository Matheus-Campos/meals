defmodule Meals.Meal.Create do
  alias Ecto.Changeset
  alias Meals.{Error, Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, %Changeset{}}) do
    {:error, Error.build(:not_found, "User not found")}
  end
end
