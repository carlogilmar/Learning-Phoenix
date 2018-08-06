defmodule Tanto.Repo.Migrations.AddComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :recipe_id, references(:recipes, on_delete: :delete_all)
    end
  end
end
