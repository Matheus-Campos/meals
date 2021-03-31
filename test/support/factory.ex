defmodule Meals.Factory do
  use ExMachina.Ecto, repo: Meals.Repo

  alias Meals.Meal

  def meal_params_factory do
    %{
      descricao: "Risole de frango",
      data: DateTime.to_string(DateTime.utc_now()),
      calorias: 70
    }
  end

  def meal_factory do
    %Meal{
      id: "fef2d8c3-e41e-4315-a8a1-f54c7f915474",
      descricao: "Risole de frango",
      data: DateTime.utc_now(),
      calorias: 70,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    }
  end
end
