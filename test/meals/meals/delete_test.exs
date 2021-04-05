defmodule Meals.Meals.DeleteTest do
  use Meals.DataCase, async: true

  import Meals.Factory

  alias Meals.{Error, Meal}
  alias Meals.Meals.Delete

  describe "call/1" do
    test "when the meal is found, it is deleted" do
      %Meal{id: meal_id} = insert(:meal)

      response = Delete.call(meal_id)

      assert {:ok, %Meal{id: ^meal_id}} = response
    end

    test "when the meal is not found, returns an error" do
      %Meal{id: meal_id} = build(:meal)

      response = Delete.call(meal_id)

      expected_response = {:error, %Error{message: "Meal not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
