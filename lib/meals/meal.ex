defmodule Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Meals.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:descricao, :data, :calorias]
  @permitted_params @required_params ++ [:id]

  @derive {Jason.Encoder, only: @permitted_params}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct, params, %User{} = user) do
    struct
    |> cast(params, @permitted_params)
    |> validate_required(@required_params)
    |> validate_number(:calorias, greater_than: 0)
    |> put_assoc(:user, user)
  end

  def changeset(params, %User{} = user), do: changeset(%__MODULE__{}, params, user)
end
