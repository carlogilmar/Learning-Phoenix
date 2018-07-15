defmodule MangoWeb.Acceptance.CategoryPageTest do

  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "Show fruits" do
    # When
    navigate_to("/categories/fruits")
    # Then
    page_title = find_elements(:css, ".page-title")
							   |> visible_text()
    assert page_title == "Fruits"
    # And
    product = find_element(:css, ".product")
							|> visible_text()
    product_name = find_within_element( product, :css, ".product-name")
							     |> visible_text()
    product_price = find_within_element( product, :css, ".product-price")
                    |> visible_text()
    assert product_name == "Apple"
    assert product_price == "100"
  end

  # test "show vegetables" do
  # end


end
