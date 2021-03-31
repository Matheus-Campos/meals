defmodule Meals.Meal.Create do
  alias Meals.{Meal, Repo}

  def call(params) do
    params
    |> parse_date()
    |> Meal.changeset()
    |> Repo.insert()
  end

  defp parse_date(%{"data" => data} = params) do
    case DateTime.from_iso8601(data) do
      {:ok, datetime, _} -> Map.put(params, "data", datetime)
      {:error, _reason} -> params
    end
  end
end
