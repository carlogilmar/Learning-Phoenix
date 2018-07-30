defmodule Mango.CatalogTest do

  use ExUnit.Case
  use Mango.DataCase
  alias Mango.Catalog.Product
  alias Mango.{Catalog, Repo}

  setup do
    Repo.insert %Product{ name: "Tomato", price: 55, sku: "A123", is_seasonal: false, category: "vegetables" }
    Repo.insert %Product{ name: "Apple", price: 75, sku: "B232", is_seasonal: true, category: "fruits" }
    :ok
  end

  test "List_products returns all products" do
    list = Catalog.list_products
    assert list
  end

  test "List all seasonal products" do
    list = Catalog.list_seasonal_products
    assert list
  end

  test "Get category products" do
    list = Catalog.get_category_products("fruits")
    assert list
  end

end
