defmodule MealsWeb.UsersView do
  use MealsWeb, :view

  def render("user.json", %{user: user}) do
    %{user: user}
  end
end
