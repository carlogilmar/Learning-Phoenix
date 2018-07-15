defmodule MangoWeb.Acceptance.HomepageTest do

	use ExUnit.Case
	use Hound.Helpers

	hound_session()

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
		assert product_name == "Apple"
		assert product_price == "100"
		refute page_source() =~ "Tomato"
	end

end
