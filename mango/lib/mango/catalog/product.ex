defmodule Mango.Catalog.Product do
  #defstruct [:name, :price, :is_seasonal, :category]
  use Ecto.Schema

  schema "products" do
    field :image, :string
    field :is_seasonal, :boolean, default: false
    field :name, :string
    field :price, :decimal
    field :sku, :string
    field :category, :string
    field :pack_size, :string
    timestamps()
  end

end
