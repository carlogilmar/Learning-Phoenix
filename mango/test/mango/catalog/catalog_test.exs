defmodule Mango.CatalogTest do

  use ExUnit.Case
  alias Mango.Catalog
  alias Mango.Catalog.Product

  test "List_products returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products
    assert p1.name == "Tomato"
    assert p2.name == "Apple"
  end

  test "List all seasonal products" do
    [product = %Product{}] = Catalog.list_seasonal_products
    assert product.name == "Tomato"
  end

	test "Get category products" do
		[product = %Product{}] = Catalog.get_category_products("fruits")
		assert product.name == "Apple"
	end

end
