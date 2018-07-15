defmodule PhoenixContexts.Repo.Migrations.CreateMechanics do
  use Ecto.Migration

  def change do
    create table(:mechanics) do

      timestamps()
    end

  end
end
