defmodule Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]
  @permitted_params @required_params ++ [:id]

  @derive {Jason.Encoder, only: @permitted_params}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @permitted_params)
    |> validate_required(@required_params)
    |> validate_number(:calorias, greater_than: 0)
  end
end
