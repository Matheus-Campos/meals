defmodule MealsWeb.MealsViewTest do
  use MealsWeb.ConnCase

  import Phoenix.View
  import Meals.Factory

  alias Meals.Meal
  alias MealsWeb.MealsView

  test "renders meal.json" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: meal)

    expected_response = %{meal: meal}

    assert response == expected_response
  end
end
