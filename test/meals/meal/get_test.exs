defmodule Meals.Meal.GetTest do
  use Meals.DataCase, async: true

  import Meals.Factory

  alias Meals.Meal
  alias Meals.Meal.Get

  describe "by_id/1" do
    test "when the meal is found, returns it" do
      %Meal{id: id} = meal = insert(:meal)

      response = Get.by_id(id)

      expected_response = {:ok, meal}

      assert response == expected_response
    end

    test "when the meal is not found, returns an error" do
      %Meal{id: id} = build(:meal)

      response = Get.by_id(id)

      expected_response = {:error, %Meals.Error{message: "Meal not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
