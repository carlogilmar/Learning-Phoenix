defmodule MangoWeb.Acceptance.CategoryPageTest do

  #use ExUnit.Case
  use Mango.DataCase
  use Hound.Helpers

  hound_session()

 setup do
    alias Mango.Repo
    alias Mango.Catalog.Product
    Repo.insert %Product{name: "Tomato", price: 50, is_seasonal: false, category: "vegetables"}
    Repo.insert %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}
    :ok
  end

  test "Show fruits" do
    # When
    navigate_to("/categories/fruits")
    # Then
    page_title = find_element(:css, ".page-title")
							   |> visible_text()
    assert page_title == "Fruits"
    # And
     product = find_element(:css, ".product")
     product_name = find_within_element(product, :css, ".product-name") |> visible_text()
     product_price = find_within_element(product, :css, ".product-price") |> visible_text()
     assert product_name == "Apple"
     assert product_price == "999"
  end

end
