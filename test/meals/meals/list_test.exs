defmodule Meals.Meals.ListTest do
  use Meals.DataCase, async: true

  import Meals.Factory

  alias Meals.Meals.List

  describe "call/0" do
    test "when there are meals, retuns them" do
      meal = insert(:meal)

      response = List.call()

      expected_response = [meal]

      assert response == expected_response
    end

    test "when there are no meals, returns an empty list" do
      response = List.call()

      expected_response = []

      assert response == expected_response
    end
  end
end
