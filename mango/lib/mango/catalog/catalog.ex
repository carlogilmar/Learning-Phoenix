defmodule Mango.Catalog do

  alias Mango.Catalog.Product

  def list_products do
    product1 = %Product{ name: "Tomato", price: 50}
    product2 = %Product{ name: "Apple", price: 100}
    [product1, product2]
  end

end
