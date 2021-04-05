defmodule Meals.User do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:nome, :cpf, :email]
  @permitted_params @required_params ++ [:id]

  @derive {Jason.Encoder, only: @permitted_params}

  schema "users" do
    field :nome, :string
    field :cpf, :string
    field :email, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:nome, min: 1)
  end
end
