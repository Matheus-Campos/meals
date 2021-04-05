defmodule Meals.Meals.List do
  import Ecto.Query

  alias Meals.{Meal, Repo}

  def call do
    query = from meal in Meal, preload: [:user]

    query
    |> Repo.all()
  end
end
