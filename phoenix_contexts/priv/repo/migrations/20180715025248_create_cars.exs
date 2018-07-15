defmodule PhoenixContexts.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :model, :string

      timestamps()
    end

  end
end
