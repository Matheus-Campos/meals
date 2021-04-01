defmodule MealsWeb.MealsControllerTest do
  use MealsWeb.ConnCase, async: true

  import Meals.Factory

  describe "create/2" do
    test "should create a meal successfully", %{conn: conn} do
      params = build(:meal_params)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calorias" => 70,
                 "data" => _data,
                 "descricao" => "Risole de frango",
                 "id" => _id
               }
             } = response
    end

    test "when there is an invalid param, returns an error", %{conn: conn} do
      params = build(:meal_params, calorias: 0)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "calorias" => ["must be greater than 0"]
        }
      }

      assert response == expected_response
    end
  end

end
