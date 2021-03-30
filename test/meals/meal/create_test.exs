defmodule Meals.Meal.CreateTest do
  use Meals.DataCase

  import Meals.Factory

  alias Meals.{Error, Meal}
  alias Meals.Meal.Create

  describe "call/1" do
    test "when all params are valid, returns a meal" do
      response =
        :meal_params
        |> build()
        |> Create.call()

      assert {:ok, %Meal{calorias: 70, data: _data, descricao: "Risole de frango"}} = response
    end

    test "when there is some invalid params, returns an invalid changeset" do
      response =
        :meal_params
        |> build(calorias: 0)
        |> Create.call()

      assert {:error, %Error{message: "User not found", status: :not_found}} = response
    end
  end
end
