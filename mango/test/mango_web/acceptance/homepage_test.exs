defmodule MangoWeb.Acceptance.HomepageTest do

  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "Presence of seasonal products" do
    assert page_source() =~ "Seasonal products"
    # Given: I start the main flow
    # When: I show the main page
    navigate_to("/")
    # Then: I should get the seasonal products
    page_title = find_element(:id, "title")
                  |> visible_text()
    assert page_title == "Seasonal Products"
  end

end
