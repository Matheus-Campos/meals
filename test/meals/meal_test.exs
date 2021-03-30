defmodule Meals.MealTest do
  use Meals.DataCase

  import Meals.Factory

  alias Ecto.Changeset
  alias Meals.Meal

  describe "changeset/1" do
    test "when all params are valid, returns an changeset" do
      response =
        :meal_params
        |> build()
        |> Meal.changeset()

      assert %Changeset{
               changes: %{
                 descricao: "Risole de frango",
                 data: _data,
                 calorias: 70
               },
               valid?: true
             } = response
    end

    test "when there is an invalid param, returns an error" do
      response =
        :meal_params
        |> build(calorias: 0)
        |> Meal.changeset()

      expected_response = %{calorias: ["must be greater than 0"]}

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when all params are valid, update the changeset" do
      update_params = %{descricao: "Risole de queijo"}

      response =
        :meal_params
        |> build()
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{
               changes: %{
                 descricao: "Risole de queijo"
               },
               valid?: true
             } = response
    end

    test "when there is an error, retuns an invalid changeset" do
      update_params = %{calorias: 0}

      response =
        :meal_params
        |> build()
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      expected_response = %{calorias: ["must be greater than 0"]}

      assert errors_on(response) == expected_response
    end
  end
end
