defmodule PhoenixContexts.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do

      timestamps()
    end

  end
end
