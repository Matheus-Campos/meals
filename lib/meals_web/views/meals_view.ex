defmodule MealsWeb.MealsView do
  use MealsWeb, :view

  alias Meals.Meal

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end