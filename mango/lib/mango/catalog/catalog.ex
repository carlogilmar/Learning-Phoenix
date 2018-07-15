defmodule Mango.Catalog do

  alias Mango.Catalog.Product

  def list_products() do
    product1 = %Product{ name: "Tomato", price: 50, category: "vegetables", is_seasonal: true}
    product2 = %Product{ name: "Apple", price: 100, category: "fruits", is_seasonal: false}
    [product1, product2]
  end

  def list_seasonal_products() do
    list_products
    |> Enum.filter( fn(product) -> product.is_seasonal == true end )
  end

end
