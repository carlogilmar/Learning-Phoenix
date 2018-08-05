defmodule Tanto.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :citext
    end

    create unique_index(:users, [:username])
  end
end
