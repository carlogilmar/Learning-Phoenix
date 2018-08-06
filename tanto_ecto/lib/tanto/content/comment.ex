defmodule Tanto.Content.Comment do

  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.Comment
  alias Tanto.Content.Recipe

  schema "comment" do
    field :body, :string
    belongs_to :recipe, Recipe
  end

end
