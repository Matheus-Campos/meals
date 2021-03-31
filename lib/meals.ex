defmodule Meals do
  alias Meals.Meal.Create

  defdelegate create_meal(params), to: Create, as: :call
end
