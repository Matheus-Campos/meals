defmodule MealsWeb.MealsView do
  use MealsWeb, :view

  alias Meals.Meal

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  def render("meals.json", %{meals: meals}), do: %{meals: meals}
end
