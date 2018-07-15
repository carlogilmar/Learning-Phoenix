defmodule PhoenixContexts.Identity.Car do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cars" do
    field :model, :string

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:model])
    |> validate_required([:model])
  end
end
