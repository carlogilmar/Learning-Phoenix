defmodule MangoWeb.Acceptance.HomepageTest do

  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "Presence of featured products" do
    navigate_to("/")
    assert page_source() =~ "Seasonal products"
  end

end
