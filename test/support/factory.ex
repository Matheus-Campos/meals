defmodule Meals.Factory do
  use ExMachina

  def meal_params_factory do
    %{
      descricao: "Risole de frango",
      data: DateTime.utc_now(),
      calorias: 70
    }
  end
end
