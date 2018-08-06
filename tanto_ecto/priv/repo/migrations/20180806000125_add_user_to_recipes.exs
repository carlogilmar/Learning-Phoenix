defmodule Tanto.Repo.Migrations.AddUserToRecipes do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
    create index(:recipes, [:user_id])
  end
end

