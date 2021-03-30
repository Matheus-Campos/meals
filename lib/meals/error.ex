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
end
