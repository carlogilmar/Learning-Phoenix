defmodule Tanto.Content.Recipe do

  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.Recipe

  schema "recipes" do
    field :title, :string
    field :body, :string
    field :lang_code, :string
    field :servings, :integer
    field :slug, :string
    field :status, :string
    field :user_id, :integer
  end

  def changeset(%Recipe{} = recipe, attrs) do
    recipe
      |> cast( attrs, [:title])
      |> validate_required([:title])
  end

end
