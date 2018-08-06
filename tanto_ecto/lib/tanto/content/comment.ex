defmodule Tanto.Content.Comment do

  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.Comment
  alias Tanto.Content.Recipe

  schema "comment" do
    field :body, :string
    belongs_to :recipe, Recipe
  end

  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast( attrs, [:body, :recipe_id])
    |> validate_required([:body, :recipe_id])
    |> foreign_key_constraint(:recipe_id)
  end

end
