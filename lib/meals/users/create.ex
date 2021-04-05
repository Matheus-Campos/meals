defmodule Meals.Users.Create do
  alias Meals.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
