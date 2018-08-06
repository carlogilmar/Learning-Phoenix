defmodule Tanto.Content.Recipe do

  use Ecto.Schema

  schema "recipes" do
    field :title, :string
    field :body, :string
    field :lang_code, :string
    field :servings, :integer
    field :slug, :string
    field :status, :string
    field :user_id, :integer
  end

end
