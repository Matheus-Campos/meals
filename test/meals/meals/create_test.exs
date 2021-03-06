defmodule Meals.Meals.CreateTest do
  use Meals.DataCase, async: true

  import Meals.Factory

  alias Ecto.Changeset
  alias Meals.Meal
  alias Meals.Meals.Create

  defp transform_map_keys_to_string(map) do
    Enum.into(map, %{}, fn {key, value} -> {Atom.to_string(key), value} end)
  end

  describe "call/1" do
    test "when all params are valid, returns a meal" do
      response =
        :meal_params
        |> build()
        |> transform_map_keys_to_string()
        |> Create.call()

      assert {:ok, %Meal{calorias: 70, data: _data, descricao: "Risole de frango"}} = response
    end

    test "when there is some invalid params, returns an invalid changeset" do
      response =
        :meal_params
        |> build(calorias: 0, data: "invalid date")
        |> transform_map_keys_to_string()
        |> Create.call()

      assert {:error, %Changeset{changes: %{calorias: 0}, valid?: false} = changeset} = response

      expected_errors = %{calorias: ["must be greater than 0"], data: ["is invalid"]}

      assert errors_on(changeset) == expected_errors
    end
  end
end
