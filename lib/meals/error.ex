defmodule Meals.Error do
  @keys [:status, :message]
  @enforce_keys @keys

  defstruct @keys

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end

  def build_meal_not_found do
    %__MODULE__{
      status: :not_found,
      message: "Meal not found"
    }
  end
end
