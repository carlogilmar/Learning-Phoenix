defmodule PhoenixContexts.Marketing.Visitor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "visitors" do

    timestamps()
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [])
    |> validate_required([])
  end
end
