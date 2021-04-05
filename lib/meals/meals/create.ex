defmodule Meals.Meals.Create do
  alias Meals.{Error, Meal, Repo, User}

  def call(params) do
    with meal_params <- parse_date(params),
         {:ok, %User{} = user} <- fetch_user(meal_params) do
      meal_params
      |> Meal.changeset(user)
      |> Repo.insert()
    end
  end

  defp fetch_user(%{"user_id" => user_id}) do
    case Repo.get(User, user_id) do
      nil -> {:error, Error.build(:bad_request, "User not found")}
      user -> {:ok, user}
    end
  end

  defp parse_date(%{"data" => data} = params) do
    case DateTime.from_iso8601(data) do
      {:ok, datetime, _} -> Map.put(params, "data", datetime)
      {:error, _reason} -> params
    end
  end
end
