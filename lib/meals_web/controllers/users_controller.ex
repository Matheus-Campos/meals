defmodule MealsWeb.UsersController do
  use MealsWeb, :controller

  alias Meals.User
  alias MealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Meals.create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end
end
