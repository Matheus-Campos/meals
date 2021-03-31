defmodule MealsWeb.MealsController do
  use MealsWeb, :controller

  alias Meals.Meal
  alias MealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{id: meal_id} = meal} <- Meals.create_meal(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", "/api/meals/#{meal_id}")
      |> render("meal.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Meals.get_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end
end
