defmodule MangoWeb.Acceptance.HomepageTest do

	use Mango.DataCase
	use Hound.Helpers

	hound_session()

 setup do
    ## GIVEN ##
    # There are two products Apple and Tomato priced 100 and 50
    # categorized under `fruits` and `vegetables` respectively
    alias Mango.Repo
    alias Mango.Catalog.Product
    Repo.insert %Product{name: "Tomato", price: 50, is_seasonal: false, category: "vegetables"}
    Repo.insert %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}
    :ok
  end

	test "Presence of seasonal products" do
		# Given: I start the main flow
		# When: I show the main page
		navigate_to("/")

		# Then: I should get the seasonal products
		page_title = find_element(:id, "title")
							 |> visible_text()
		assert page_title == "Seasonal Products"

		# And
		product = find_element(:css, ".product")
		product_name = find_within_element(product, :css, ".product-name") |> visible_text()
		product_price = find_within_element(product, :css, ".product-price") |> visible_text()
		assert product_name == "Tomato"
		#assert product_price == "50"
		#refute page_source() =~ "Apple"
	end

end
