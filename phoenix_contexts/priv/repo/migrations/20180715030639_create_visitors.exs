defmodule PhoenixContexts.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do

      timestamps()
    end

  end
end
