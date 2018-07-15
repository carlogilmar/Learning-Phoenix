defmodule PhoenixContexts.Inpection.Owner do
  use Ecto.Schema
  import Ecto.Changeset


  schema "owners" do

    timestamps()
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [])
    |> validate_required([])
  end
end
