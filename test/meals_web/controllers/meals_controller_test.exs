defmodule MealsWeb.MealsControllerTest do
  use MealsWeb.ConnCase, async: true

  import Meals.Factory

  alias Meals.Meal

  describe "index/2" do
    test "should list meals successfully", %{conn: conn} do
      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :index))
        |> json_response(:ok)

      assert %{
               "meals" => [
                 %{
                   "calorias" => 70,
                   "data" => _data,
                   "descricao" => "Risole de frango",
                   "id" => "fef2d8c3-e41e-4315-a8a1-f54c7f915474"
                 }
               ]
             } = response
    end
  end

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

  describe "show/2" do
    test "should get a meal successfully", %{conn: conn} do
      %Meal{id: meal_id} = insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, meal_id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calorias" => 70,
                 "data" => _data,
                 "descricao" => "Risole de frango",
                 "id" => ^meal_id
               }
             } = response
    end

    test "when there is an invalid id, returns an error", %{conn: conn} do
      meal_id = "banana"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, meal_id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid UUID format"}

      assert response == expected_response
    end

    test "when the meal is not found, returns an error", %{conn: conn} do
      %Meal{id: meal_id} = build(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, meal_id))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "should update a meal successfully", %{conn: conn} do
      %Meal{id: meal_id} = insert(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal_id, %{descricao: "descricao atualizada"}))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calorias" => 70,
                 "data" => _data,
                 "descricao" => "descricao atualizada",
                 "id" => ^meal_id
               }
             } = response
    end

    test "when there is an invalid id, returns an error", %{conn: conn} do
      meal_id = "banana"

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal_id, %{}))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid UUID format"}

      assert response == expected_response
    end

    test "when there is an invalid param, returns an error", %{conn: conn} do
      %Meal{id: meal_id} = insert(:meal)

      params = %{calorias: 0}

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal_id, params))
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"calorias" => ["must be greater than 0"]}}

      assert response == expected_response
    end

    test "when the meal is not found, returns an error", %{conn: conn} do
      %Meal{id: meal_id} = build(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal_id, %{calorias: 200}))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "should delete a meal successfully", %{conn: conn} do
      %Meal{id: meal_id} = insert(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, meal_id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there is an invalid id, returns an error", %{conn: conn} do
      meal_id = "banana"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, meal_id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid UUID format"}

      assert response == expected_response
    end

    test "when the meal is not found, returns an error", %{conn: conn} do
      %Meal{id: meal_id} = build(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, meal_id))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert response == expected_response
    end
  end
end
