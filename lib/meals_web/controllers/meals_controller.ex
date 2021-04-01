defmodule MealsWeb.MealsController do
  use MealsWeb, :controller

  alias Meals.Meal
  alias MealsWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    meals = Meals.list_meals()

    conn
    |> put_status(:ok)
    |> render("meals.json", meals: meals)
  end

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

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Meals.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Meals.delete_by_id(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
