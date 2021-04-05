defmodule Meals.Meals.UpdateTest do
  use Meals.DataCase, async: true

  import Meals.Factory

  alias Meals.{Error, Meal}
  alias Meals.Meals.Update

  describe "call/1" do
    test "should update a meal successfully" do
      %Meal{id: meal_id} = insert(:meal)

      update_params = %{"id" => meal_id, "descricao" => "descricao atualizada"}

      response = Update.call(update_params)

      assert {:ok, %Meal{id: ^meal_id, descricao: "descricao atualizada", calorias: 70}} = response
    end

    test "when there is an invalid param, returns an error" do
      %Meal{id: meal_id} = insert(:meal)

      update_params = %{"id" => meal_id, "calorias" => 0}

      response = Update.call(update_params)

      assert {:error, changeset} = response

      expected_errors = %{calorias: ["must be greater than 0"]}

      assert errors_on(changeset) == expected_errors
    end

    test "when the meal is not found, returns an error" do
      %Meal{id: meal_id} = build(:meal)

      update_params = %{"id" => meal_id, "calorias" => 120}

      response = Update.call(update_params)

      expected_response = {:error, %Error{message: "Meal not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
