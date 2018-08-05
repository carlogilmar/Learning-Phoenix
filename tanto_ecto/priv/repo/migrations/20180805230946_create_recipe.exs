defmodule Tanto.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :body, :string
      add :lang_code, :string
      add :slug,:string
      add :servings, :integr
      add :status,:string
    end
		create unique_index(:recipes, [:slug])
  end
end
