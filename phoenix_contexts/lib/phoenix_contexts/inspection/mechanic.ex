defmodule PhoenixContexts.Inspection.Mechanic do
  use Ecto.Schema
  import Ecto.Changeset


  schema "mechanics" do

    timestamps()
  end

  @doc false
  def changeset(mechanic, attrs) do
    mechanic
    |> cast(attrs, [])
    |> validate_required([])
  end
end
